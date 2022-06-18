//
//  UserLocalDataProvider.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

struct UserLocalDataProvider {
    
    static var shared = UserLocalDataProvider()
    
    private init() { }
    
    func getSavedUsers() -> [User] {
        return try! Realm().objects(UserRealm.self).map({ $0.transform() })
    }
    
    func saveUser(_ user: User) {
        let realm = try! Realm()
        try! realm.write({ realm.add(user.localTransform()) })
    }
    
    func removeUser(_ user: User) {
        let realm = try! Realm()
        if let user = realm.objects(UserRealm.self).first(where: { user.email == $0.getEmail() }) {
            try! realm.write({ realm.delete(user) })
        }
    }
    
    func getSearchUsers(_ searchedText: String) -> [User] {
        return getSavedUsers().filter({ $0.email.contains(searchedText) || $0.gender.contains(searchedText) || $0.phone.contains(searchedText) || $0.getName().contains(searchedText) || $0.getInfo().contains(searchedText) })
    }
}
