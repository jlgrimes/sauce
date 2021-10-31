//
//  PlaceSearch.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import SkeletonUI
import MapKit

func void(str: String) -> Void {}

struct PlaceSearchView: View {
    @State var value: String = ""
    var onChange: (String) -> Void
    @Binding var places: [MKMapItem]?
    @Binding var resultsLoading: Bool
    // Tracks initial state of view
    @State var initialState: Bool = true
    
    var body: some View {
        VStack {
            TextField(
                "Search for a place",
                text: $value
            ).padding(5.0).onChange(of: value, perform: { newValue in
                onChange(newValue)
                initialState = false
            })
            List {
                if initialState == false && resultsLoading == false && value != "" && (places == nil) {
                    Text("No results found :(")
                }
                
                if resultsLoading == true {
                    ForEach(0..<10, id: \.self) { place in
                        VStack(alignment: .leading) {
                            Text("Some name of a place")
                                .skeleton(with: true)
                                .multiline(lines: 2, scales: [1: 0.5])
                                .padding(5.0)
                        }
                    }
                } else {
                    ForEach(places ?? [], id: \.self) { place in
                        VStack(alignment: .leading) {
                            Text(place.name!)
                            Text(place.placemark.formattedAddress ?? "")
                                .font(.caption)
                        }.padding(5.0)
                    }
                }
            }
        }
    }
}

struct PlaceSearch_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSearchView(onChange: void, places: .constant([]), resultsLoading: .constant(false))
    }
}
