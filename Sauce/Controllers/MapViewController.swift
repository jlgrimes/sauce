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
    let places: AllPlaces = SAMPLE_ALL_PLACES
    @State var region = SAMPLE_REGION
    @EnvironmentObject var mapState: MapState
    
    var body: some View {
        MapView(allPlaces: places, region: $region, selectedPlace: $mapState.selectedPlace, bottomSheetPosition: $mapState.bottomSheetPosition)
            .environmentObject(mapState)
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController().environmentObject(MapState())
    }
}
