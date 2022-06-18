//
//  PictureRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class PictureRealm: Object {
    
    @objc private dynamic var medium: String!
    @objc private dynamic var large: String!
    
    convenience init(medium: String, large: String) {
        self.init()
        
        self.medium = medium
        self.large = large
    }
    
    func transform() -> Picture {
        return Picture(large: large, medium: medium)
    }
}
