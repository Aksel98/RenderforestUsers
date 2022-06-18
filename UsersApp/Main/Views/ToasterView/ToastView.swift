//
//  ToastViewC.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class ToastView: UIView {
    
    private let ratio: CGFloat = 1.4
    private var isSwiped: Bool = false
    
    private var relativeViewFrame: CGRect!
    private var snackBarViewWidth: CGFloat!
    private var snackBarViewHeight: CGFloat!
    private var yPositionDistance: CGFloat!
    private var animateDuration: Double!
    private var autoCloseTime: Double!
    private var openFromTop: Bool!
    
    init(config: ToastViewConfig) {
        super.init(frame: .zero)
        
        backgroundColor = config.backgroundColor
        layer.cornerRadius = config.cornerRadius
        alpha = config.alfa
        relativeViewFrame = config.frame
        snackBarViewWidth = (config.width != nil) ? config.width : relativeViewFrame.width / ratio
        snackBarViewHeight = config.height
        yPositionDistance = config.yPositionDistance
        animateDuration = config.animateDuration
        autoCloseTime = config.autoCloseTime
        openFromTop = config.openFromTop
        
        config.view.fixInView(self)
        openSnackBar()
        
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeToCloseView)))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setFrame(yPosition: CGFloat = 0) {
        self.frame = CGRect(x: 0, y: yPosition, width: snackBarViewWidth, height: snackBarViewHeight)
    }
    
    private func openSnackBar() {
        setFrame(yPosition: getSnackBarYPositionDistance(-snackBarViewHeight))
        
        UIView.animate(withDuration: animateDuration, animations: {
            self.setFrame(yPosition: self.getSnackBarYPositionDistance(self.yPositionDistance))
        })
        
        closeSnackBar(autoCloseTime: autoCloseTime)
    }
    
    private func closeSnackBar(autoCloseTime: Double = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + autoCloseTime, execute: { [weak self] in
            guard let self = self else { return }
            
            UIView.animate(withDuration: self.animateDuration, animations: {
                self.frame.origin.y = self.getSnackBarYPositionDistance(-self.snackBarViewHeight)
            }, completion: { finished in
                if finished {
                    self.removeFromSuperview()
                }
            })
        })
    }
    
    @objc private func swipeToCloseView(sender: UIPanGestureRecognizer) {
        let viewTranslation = sender.translation(in: self)
        
        switch sender.state {
        case .changed:
            if openFromTop ? viewTranslation.y < 0 : viewTranslation.y > 0, !isSwiped {
                isSwiped = true
                closeSnackBar()
            }
        default: break
        }
    }
    
    private func getSnackBarYPositionDistance(_ distance: CGFloat = 0) -> CGFloat {
        return openFromTop ? distance : relativeViewFrame.height - snackBarViewHeight - distance
    }
}
