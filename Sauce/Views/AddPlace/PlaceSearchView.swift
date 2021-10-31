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
func void(str: MKMapItem) -> Void {}

struct PlaceSearchView: View {
    @State var value: String = ""
    var onChange: (String) -> Void
    @Binding var places: [MKMapItem]?
    @Binding var resultsLoading: Bool
    var onSelect: (MKMapItem) -> Void
    // Tracks initial state of view
    @State var initialState: Bool = true
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            SearchBarView(value: $value, onChange: { newValue in
                onChange(newValue)
                initialState = false
            }).focused($isFocused).onAppear(perform: {
                // key part: delay setting isFocused until after some-internal-iOS setup
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                  isFocused = true
                }
            })
            List {
                if initialState == false && resultsLoading == false && value != "" && (places == nil) {
                    Text("No results found :(")
                }
                
                if resultsLoading == true {
                    ForEach(0..<10, id: \.self) { place in
                        VStack(alignment: .leading) {
                            PlaceShortDisplayView(loading: true)
                        }
                    }
                } else {
                    ForEach(places ?? [], id: \.self) { place in
                        PlaceShortDisplayView(place: place, onSelect: onSelect)
                    }
                }
            }
        }
    }
}

struct PlaceSearch_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSearchView(onChange: void, places: .constant([]), resultsLoading: .constant(false), onSelect: void)
    }
}
