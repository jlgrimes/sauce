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
    var price: Int?
    var methodOfEat: MethodOfEat?
    var cuisineType: String = ""
    var order: String = ""
    var rating: Float = 0
    var otherThoughts: String = ""
    
    var invalidPlace: Bool = false
    var invalidPrice: Bool = false
    var invalidMethodOfEat: Bool = false
    var invalidCuisineType: Bool = false
    var invalidOrder: Bool = false
    var invalidRating: Bool = false
    
    func setSelectedPlace(place: MKMapItem) {
        selectedPlace = place
    }
    
    func validateState() -> Bool {
        if selectedPlace == nil {
            invalidPlace = true
        } else {
            invalidPlace = false
        }
        
        if price == nil {
            invalidPrice = true
        } else {
            invalidPrice = false
        }
        
        if methodOfEat == nil {
            invalidMethodOfEat = true
        } else {
            invalidMethodOfEat = false
        }
        
        if cuisineType == "" {
            invalidCuisineType = true
        } else {
            invalidCuisineType = false
        }
        
        if order == "" {
            invalidOrder = true
        } else {
            invalidOrder = false
        }
        
        if rating == 0 {
            invalidRating = true
        } else {
            invalidRating = false
        }
        
        if invalidPlace || invalidPrice || invalidMethodOfEat || invalidCuisineType || invalidOrder || invalidRating {
            return false
        }
        
        return true
    }
}
