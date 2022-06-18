//
//  UserSelectionCommand.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import Foundation
import UIKit

struct UserSelectionCommand: CommonCommand {
    
    private let user: User
    private let backAction: (() -> Void)?
    
    init(user: User, backAction: (() -> Void)?) {
        self.user = user
        self.backAction = backAction
    }
    
    func execute() {
        let controller = SingleUserController()
        controller.backAction = backAction
        controller.setUser(user)
        (AppDelegate.getController() as? UINavigationController)?.pushViewController(controller, animated: true)
    }
}
