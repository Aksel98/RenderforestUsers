//
//  User.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import Foundation

struct User: Decodable {
    let gender: String
    let phone: String
    let email: String
    let name: Name
    let location: Location
    let picture: Picture
    
    func getName() -> String {
        return "\(name.first) \(name.last)"
    }
    
    func getInfo() -> String {
        return """
        \(gender.capitalized), \(phone)
        \(location.country)
        \(location.street.number) \(location.street.name) \(location.state) \(location.city)
        """
    }
}
