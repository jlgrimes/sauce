//
//  AddPlaceStateModel.swift
//  Sauce
//
//  Created by Jared Grimes on 11/10/21.
//

import Foundation
import MapKit

class AddPlaceState {
    var selectedPlace: MKMapItem?
    var date: Date = Date()
    var price: Int = 1
    var methodOfEat: MethodOfEat = .dineIn
    var cuisineType: String = ""
    var order: String = ""
    var rating: Float = 5
    var otherThoughts: String = ""
    
    func setSelectedPlace(place: MKMapItem) {
        selectedPlace = place
    }
}
