//
//  LocationRealm.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import RealmSwift

class LocationRealm: Object {
    
    @objc private dynamic var country: String!
    @objc private dynamic var city: String!
    @objc private dynamic var state: String!
    @objc private dynamic var street: StreetRealm!
    @objc private dynamic var coordinates: CoordinatesRealm!
    
    convenience init(country: String, city: String, state: String, street: StreetRealm, coordinates: CoordinatesRealm) {
        self.init()
        
        self.country = country
        self.city = city
        self.state = state
        self.street = street
        self.coordinates = coordinates
    }
    
    func transform() -> Location {
        return Location(country: country, city: city, state: state, street: street.transform(), coordinates: coordinates.transform())
    }
}
