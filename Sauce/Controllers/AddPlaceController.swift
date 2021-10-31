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
                NavigationLink(destination: PlaceSearchController(onSelect: void).navigationBarTitle("Search")) {
                    SearchBarView(value: .constant(""), onChange: void)
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
