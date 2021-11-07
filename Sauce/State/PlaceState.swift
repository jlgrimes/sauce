//
//  PlaceState.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation

final class PlaceState: ObservableObject {
    @Published var allPlaces: AllPlaces
    
    init() {
        allPlaces = AllPlaces()
    }
    
    func loadPlaces(response: Array<Entry>) {
        allPlaces.loadPlaces(entries: response)
    }
}
