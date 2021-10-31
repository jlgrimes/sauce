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
    let places = SAMPLE_PLACES
    @State var region = SAMPLE_REGION
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden
    @State private var selectedPlace: Place = Place()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                MapView(places: places, region: $region, selectedPlace: $selectedPlace, bottomSheetPosition: $bottomSheetPosition)
                
                if bottomSheetPosition == .hidden {
                    NavigationLink(
                        destination: AddPlaceView(), // <1>
                        label: {
                            AddPlaceButton()
                        })
                }
            }
        }
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewController()
    }
}
