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
    
    init(user: User) {
        self.user = user
    }
    
    func execute() {
        let controller = SingleUserController()
        controller.user = user
        (AppDelegate.getController() as? UINavigationController)?.pushViewController(controller, animated: true)
    }
}
