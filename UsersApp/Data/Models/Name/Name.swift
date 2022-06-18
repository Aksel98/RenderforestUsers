//
//  Name.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import Foundation

struct Name: Decodable {
    var first: String
    var last: String
    
    func localTransform() -> NameRealm {
        return NameRealm(first: first, last: last)
    }
}
