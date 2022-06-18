//
//  OpenToastCommand.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class OpenToastCommand: CommonCommand {
    
    private weak var controller: UIViewController?
    var config: ToastViewConfig
    
    init(config: ToastViewConfig, controller: UIViewController? = AppDelegate.getController()) {
        self.config = config
        self.controller = controller
    }
    
    func execute() {
        let toastView = ToastView(config: config)
        toastView.center.x = controller?.view.center.x ?? 0

        controller?.view.addSubview(toastView)
    }
}
