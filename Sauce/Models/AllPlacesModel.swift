//
//  AllPlacesModel.swift
//  Sauce
//
//  Created by Jared Grimes on 11/1/21.
//

import Foundation
import CoreLocation

class AllPlaces {
    var places: Array<Place>
    
    init() {
        places = []
    }
    
    init(places: Array<Place>) {
        self.places = places
    }
    
    func getPlaces() -> Array<Place> {
        return places
    }
    
    func loadPlaces(entries: Array<Entry>) {
        places = entries.reduce([], { acc, curr in
            // Initialize place entry object
            let placeEntry = PlaceEntry(entry: curr)
            
            let currCoordinate = CLLocationCoordinate2D(latitude: curr.place.coordinate[0]!, longitude: curr.place.coordinate[1]!)
            
            // If the coordinate is the same as a place already stored
            let existingPlaceIndex = acc.firstIndex(where: {
                $0.getPlacemark().coordinate.latitude == currCoordinate.latitude && $0.getPlacemark().coordinate.latitude == currCoordinate.longitude
            })
            
            if (existingPlaceIndex == nil) {
                return acc + [ Place(placeEntry: placeEntry, coordinate: currCoordinate, name: curr.place.name) ]
            } else {
                acc[existingPlaceIndex!].addPlace(placeEntry: placeEntry)
                return acc
            }
        })
    }
}
