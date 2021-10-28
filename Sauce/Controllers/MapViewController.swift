//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit

struct MapViewController: View {
    let place = IdentifiablePlace(id: UUID(), lat: 25.7617, long: 80.1918)
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [place]
        ) { place in
            MapMarker(coordinate: place.location)
        }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
    }
}
