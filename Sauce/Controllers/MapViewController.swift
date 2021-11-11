//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit
import BottomSheet
import CoreLocation

struct MapViewController: View {
    let locationManager = CLLocationManager()
    
    @State var region: MKCoordinateRegion
    @EnvironmentObject var mapState: MapState
    @EnvironmentObject var placeState: PlaceState
    
    init() {
        region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    var body: some View {
        MapView(allPlaces: placeState.allPlaces, region: $region, selectedPlace: $mapState.selectedPlace, bottomSheetPosition: $mapState.bottomSheetPosition)
            .environmentObject(mapState)
            .environmentObject(placeState)
            .onAppear {
                locationManager.requestWhenInUseAuthorization()
            }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
            .environmentObject(MapState())
            .environmentObject(PlaceState())
    }
}
