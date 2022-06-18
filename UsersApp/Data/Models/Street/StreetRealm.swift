//
//  StreetRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class StreetRealm: Object {
    
    @objc private dynamic var number: Int = 0
    @objc private dynamic var name: String!
    
    convenience init(number: Int, name: String) {
        self.init()
        
        self.number = number
        self.name = name
    }
    
    func transform() -> Street {
        return Street(number: number, name: name)
    }
}
