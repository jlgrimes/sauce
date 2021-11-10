//
//  SampleData.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import Foundation
import MapKit

var SAMPLE_REGION: MKCoordinateRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 40.75773,
        longitude: -73.985708
    ),
    span: MKCoordinateSpan(
        latitudeDelta: 0.05,
        longitudeDelta: 0.05
    )
)

var SAMPLE_PLACE_ENTRY = PlaceEntry(
    order: "Baconeggandcheese",
    rating: 8,
    cuisine: ["Cafe"],
    price: 2,
    method: .dineIn
)

var SAMPLE_PLACE = Place(placeEntries: [
    SAMPLE_PLACE_ENTRY,
    PlaceEntry(
        order: "Diet coke, an orange, couple of hashbrowns, a large milkshake to go",
        rating: 7,
        cuisine: ["Cafe"],
        price: 2,
        method: .pickup
    )
], coordinate: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), name: "Empire State Cafe")

var SAMPLE_ALL_PLACES: AllPlaces = AllPlaces(places: [
    SAMPLE_PLACE,
    Place(placeEntries: [
        PlaceEntry(
            order: "Gold plated burger, side of fries",
            rating: 8,
            cuisine: ["American"],
            price: 3,
            method: .dineIn
        ),
        PlaceEntry(
            order: "1 Diet Coke",
            rating: 9,
            cuisine: ["American"],
            price: 1,
            method: .dineIn
        )
    ], coordinate: CLLocationCoordinate2D(latitude: 40.759010, longitude: -73.984474), name: "Hard Rock Cafe Times Square")
])
