//
//  BaseCustomView.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class BaseCustomView: UIView {
    
    private weak var mainView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(mainView: UIView?) {
        super.init(frame: .zero)
        self.mainView = mainView
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(getXibName(), owner: self, options: nil)
        getContentView().fixInView(self)
        
        if let mainView = mainView {
            self.fixInView(mainView)
        }
    }
    
    func getContentView() -> UIView {
        return UIView()
    }
    
    func getXibName() -> String {
        return ""
    }
}
