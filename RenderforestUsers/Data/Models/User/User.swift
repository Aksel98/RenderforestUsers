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
}
