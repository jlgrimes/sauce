//
//  PlaceEntryModel.swift
//  Sauce
//
//  Created by Jared Grimes on 11/1/21.
//

import Foundation
import MapKit

struct PlaceEntry: Identifiable {
    let id: UUID
    let order: String
    let rating: Int
    let cuisine: String
    let price: Int
    let method: MethodOfEat
    
    // Init with data, normal usage
    init(entry: Entry) {
        self.id = UUID(uuidString: entry.id)!
        self.order = entry.order
        self.rating = entry.rating
        self.cuisine = entry.cuisine ?? ""
        self.price = entry.price ?? 0
        self.method = entry.method ?? .dineIn
    }
    
    // Init with sample data usage
    init(order: String, rating: Int, cuisine: String, price: Int, method: MethodOfEat) {
        self.order = order
        self.id = UUID()
        self.rating = rating
        self.cuisine = cuisine
        self.price = price
        self.method = method
    }
}
