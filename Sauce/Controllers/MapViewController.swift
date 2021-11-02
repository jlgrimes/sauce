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
    @Binding var bottomSheetPosition: BottomSheetPosition
    @State private var selectedPlace: Place = SAMPLE_PLACE
    
    var body: some View {
        MapView(allPlaces: places, region: $region, selectedPlace: $selectedPlace, bottomSheetPosition: $bottomSheetPosition)
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController(bottomSheetPosition: .constant(.bottom))
    }
}
