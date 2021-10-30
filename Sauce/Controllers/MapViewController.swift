//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case high = 0.8, bottom = 0.4, hidden = 0
}

struct MapViewController: View {
    let places = [
        Place(id: UUID(), name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
        Place(id: UUID(), name: "Times square", coordinate: CLLocationCoordinate2D(latitude: 40.759010, longitude: -73.984474))
    ]
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
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden
    @State private var bottomSheetShown: Bool = false
    @State private var selectedPlace: Place = Place()
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: places
        ) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView(place: place, bottomSheetPosition: $bottomSheetPosition, selectedPlace: $selectedPlace)
            }
        }.bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, headerContent: {
            Text(selectedPlace.name).font(.title).bold()
        }) {
            Text("hi")
        }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
    }
}
