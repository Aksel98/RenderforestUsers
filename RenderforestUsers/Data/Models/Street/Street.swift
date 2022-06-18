//
//  Street.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import Foundation

struct Street: Decodable {
    let number: Int
    let name: String
    
    func localTransform() -> StreetRealm {
        return StreetRealm(number: number, name: name)
    }
}
