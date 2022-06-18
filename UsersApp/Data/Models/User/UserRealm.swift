//
//  UserRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class UserRealm: Object {
    
    @objc dynamic private var gender: String!
    @objc dynamic private var phone: String!
    @objc dynamic private var email: String!
    @objc dynamic private var name: NameRealm!
    @objc dynamic private var location: LocationRealm!
    @objc dynamic private var picture: PictureRealm!
    
    convenience init(gender: String, phone: String, email: String, name: NameRealm, location: LocationRealm, picture: PictureRealm) {
        self.init()
        
        self.gender = gender
        self.phone = phone
        self.email = email
        self.name = name
        self.location = location
        self.picture = picture
    }
    
    func getEmail() -> String {
        return email
    }
    
    func transform() -> User {
        return User(gender: gender, phone: phone, email: email, name: name.transform(), location: location.transform(), picture: picture.transform())
    }
}
