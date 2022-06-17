//
//  UserApiDataProvider.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import Foundation

class UserApiDataProvider {
    
    static var shared = UserApiDataProvider()
    
    private var users: [User] = []
    private var page: Int = 1
    
    private init() {
        loadUsers()
    }
    
    func loadUsers() {
        GetUsersCommand(successHandler: { [weak self] users in
            self?.users = users
        }, page: page).execute()
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func changePage() {
        page += 1
    }
}
