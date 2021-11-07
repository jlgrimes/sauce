//
//  PlaceState.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation
import Amplify

final class PlaceState: ObservableObject {
    @Published var allPlaces: AllPlaces
    
    init() {
        allPlaces = AllPlaces()
    }

    func fetchPlaces() {
        Amplify.DataStore.query(Entry.self) { result in
            switch(result) {
            case .success(let places):
                allPlaces.loadPlaces(entries: places)
                for places in places {
                    print("==== Place ====")
                    print("ID: \(places.id)")
                    print("Name: \(places.place.name)")
                    print("Order: \(places.order)")
                }
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
        }
    }
}
