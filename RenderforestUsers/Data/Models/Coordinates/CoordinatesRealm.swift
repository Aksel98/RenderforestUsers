//
//  CoordinatesRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class CoordinatesRealm: Object {
    
    @objc private dynamic var latitude: String = ""
    @objc private dynamic var longitude: String = ""
    
    convenience init(latitude: String, longitude: String) {
        self.init()
        
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func transform() -> Coordinates {
        return Coordinates(latitude: latitude, longitude: longitude)
    }
}
