//
//  IdentifiablePlace.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let name: String
    let coordinate: CLLocationCoordinate2D
}
