//
//  PlaceSearch.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import MapKit

func void(str: String) -> Void {}

struct PlaceSearchView: View {
    @State var value: String = ""
    var onChange: (String) -> Void
    @Binding var places: [MKMapItem]?
    
    
    var body: some View {
        VStack {
            TextField(
                "Search for a place",
                text: $value
            ).onChange(of: value, perform: { newValue in
                onChange(newValue)
            })
            List {
                ForEach(places ?? [], id: \.self) { place in
                    VStack(alignment: .leading) {
                        Text(place.name!)
                        Text(place.placemark.formattedAddress ?? "").font(.caption)
                    }
                }
            }
        }
    }
}

struct PlaceSearch_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSearchView(onChange: void, places: .constant([]))
    }
}
