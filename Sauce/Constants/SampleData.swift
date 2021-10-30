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

var SAMPLE_PLACES: Array<Place> = [
    Place(
        id: UUID(),
        name: "Empire State Cafe",
        coordinate: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664),
        rating: 8,
        cuisine: "Cafe",
        price: 2
    ),
    Place(
        id: UUID(),
        name: "Hard Rock Times Square",
        coordinate: CLLocationCoordinate2D(latitude: 40.759010, longitude: -73.984474),
        rating: 7,
        cuisine: "American",
        price: 3
    )
]
