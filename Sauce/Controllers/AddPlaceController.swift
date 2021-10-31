//
//  AddPlaceController.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import MapKit

struct AddPlaceController: View {
    @State var selectedPlace: MKMapItem?
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PlaceSearchController(onSelect: { place in
                        selectedPlace = place
                }).navigationBarTitle("Search")) {
                    if (selectedPlace == nil) {
                        SearchBarView(value: .constant(""), onChange: void)
                    } else {
                        PlaceShortDisplayView(place: selectedPlace)
                    }
                }
                AddPlaceView()
            }
        }
    }
}

struct AddPlaceController_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceController()
    }
}
