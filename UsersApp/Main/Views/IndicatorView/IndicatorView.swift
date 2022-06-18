//
//  IndicatorView.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class IndicatorView: BaseCustomView, Loader {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var backgroundAlpha: CGFloat = 0.2
    private var mainBackgroundColor: UIColor = .baseColors.getBlack()
    
    init(containerView: UIView, backgroundAlpha: CGFloat = 0.2, backgroundColor: UIColor = .baseColors.getBlack()) {
        self.backgroundAlpha = backgroundAlpha
        mainBackgroundColor = backgroundColor
        
        super.init(frame: .zero)

        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        containerView.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func getXibName() -> String {
        return "\(IndicatorView.self)"
    }

    override func getContentView() -> UIView {
        return contentView
    }
    
    override func commonInit() {
        super.commonInit()
        
        backgroundColor = mainBackgroundColor.withAlphaComponent(backgroundAlpha)
        stop()
    }
    
    func setIndicator(style: UIActivityIndicatorView.Style, color: UIColor? = nil) {
        activityIndicator.style = style
        
        if let color = color {
            activityIndicator.color = color
        }
    }
    
    func stop() {
        isHidden = true
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func start() {
        isHidden = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}
