//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit

struct MapViewController: View {
    let place = IdentifiablePlace(id: UUID(), name: "Place", coordinate: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708))
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
    @State private var bottomSheetShown = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                annotationItems: [place]
            ) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    PlaceAnnotationView(title: place.name, bottomSheetShown: $bottomSheetShown)
                }
            }
            GeometryReader { geometry in
                BottomSheetView(
                    isOpen: self.$bottomSheetShown,
                    maxHeight: geometry.size.height * 0.4
                ) {
                    Color.blue
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
    }
}
