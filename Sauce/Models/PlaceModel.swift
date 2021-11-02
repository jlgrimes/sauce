//
//  IdentifiablePlace.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import MapKit

class Place: Identifiable {
    let id: UUID = UUID()
    let placemark: MKPlacemark
    let name: String
    var placeEntries: Array<PlaceEntry>
    
    // Initializer with place entry and a coordinate
    init(placeEntry: PlaceEntry, coordinate: CLLocationCoordinate2D, name: String) {
        self.placemark = MKPlacemark(coordinate: coordinate)
        self.placeEntries = [ placeEntry ]
        self.name = name
    }
    
    // Initializer with multiple place entries and a coordinate
    init(placeEntries: Array<PlaceEntry>, coordinate: CLLocationCoordinate2D, name: String) {
        self.placemark = MKPlacemark(coordinate: coordinate)
        self.placeEntries = placeEntries
        self.name = name
    }
    
    func addPlace(placeEntry: PlaceEntry) {
        self.placeEntries += [ placeEntry ]
    }
    
    func getAverageRating() -> Float {
        return Float(placeEntries.reduce(0, { $0 + $1.rating })) / Float(placeEntries.count)
    }
    
    func getCuisineTypes() -> String {
        return Array(Set(placeEntries.map({ $0.cuisine }))).joined(separator: ", ")
    }
    
    func getAveragePrice() -> Int {
        return placeEntries.reduce(0, { $0 + $1.price }) / placeEntries.count
    }
    
    func getPlacemark() -> MKPlacemark {
        return placemark
    }
}
