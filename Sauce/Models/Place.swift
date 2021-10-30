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
    let rating: Int
    let cuisine: String
    let price: Int
    
    init() {
        id = UUID()
        name = ""
        coordinate = CLLocationCoordinate2D()
        rating = 0
        cuisine = ""
        price = 0
    }
    
    init(id: UUID, name: String, coordinate: CLLocationCoordinate2D, rating: Int, cuisine: String, price: Int) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
        self.rating = rating
        self.cuisine = cuisine
        self.price = price
    }
}
