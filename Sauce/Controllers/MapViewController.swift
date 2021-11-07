//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import MapKit
import BottomSheet

struct MapViewController: View {
    @State var region = SAMPLE_REGION
    @EnvironmentObject var mapState: MapState
    @EnvironmentObject var placeState: PlaceState
    
    var body: some View {
        MapView(allPlaces: placeState.allPlaces, region: $region, selectedPlace: $mapState.selectedPlace, bottomSheetPosition: $mapState.bottomSheetPosition)
            .environmentObject(mapState)
            .environmentObject(placeState)
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
            .environmentObject(MapState())
            .environmentObject(PlaceState())
    }
}
