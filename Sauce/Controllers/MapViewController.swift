//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit

struct MapViewController: View {
    let place = IdentifiablePlace(id: UUID(), lat: 40.75773, long: -73.985708)
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 40.75773,
            longitude: -73.985708
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
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
