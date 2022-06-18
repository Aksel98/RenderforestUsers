//
//  NameRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class NameRealm: Object {

    @objc dynamic var first: String!
    @objc dynamic var last: String!
    
    convenience init(first: String, last: String) {
        self.init()
        
        self.first = first
        self.last = last
    }
    
    func transform() -> Name {
        return Name(first: first, last: last)
    }
}
