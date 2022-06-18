//
//  UserApiDataProvider.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

class UserApiDataProvider {
    
    static var shared = UserApiDataProvider()
    
    private var users: [User] = []
    private var page: Int = 1
    
    private init() { }
    
    func loadUsers(complition: @escaping (() -> Void)) {
        GetUsersCommand(successHandler: { [weak self] users in
            self?.users += users
            complition()
        }, errorHandler: { [weak self] errorMessage in
            guard let self = self else { return }
            
            OpenToastCommand(config: ToastViewConfig(view: self.getLabel(message: errorMessage), frame: AppDelegate.getController()?.view.frame ?? CGRect())).execute()
        }, page: page).execute()
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func getSearchUsers(_ searchedText: String) -> [User] {
        return getUsers().filter({ $0.email.contains(searchedText) || $0.gender.contains(searchedText) || $0.phone.contains(searchedText) || $0.getName().contains(searchedText) || $0.getInfo().contains(searchedText) })
    }
    
    func changePage() {
        page += 1
    }
    
    private func getLabel(message: String) -> UILabel {
        let label = UILabel()
        label.text = message
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }
}
