//
//  IdentifiablePlace.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import MapKit

struct Place: Identifiable {
    let id: UUID
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init() {
        id = UUID()
        name = ""
        coordinate = CLLocationCoordinate2D()
    }
    
    init(id: UUID, name: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
    }
}
