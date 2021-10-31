//
//  PlaceShortDisplayView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import MapKit

struct PlaceShortDisplayView: View {
    var place: MKMapItem = MKMapItem()
    var onSelect: (MKMapItem) -> Void = void
    var loading: Bool = false
    
    init(loading: Bool) {
        self.loading = loading
    }
    
    init(place: MKMapItem, onSelect: @escaping (MKMapItem) -> Void) {
        self.place = place
        self.onSelect = onSelect
    }
    
    var body: some View {
        if loading {
            Text("Some name of a place")
                .skeleton(with: true)
                .multiline(lines: 2, scales: [1: 0.5])
                .padding(5.0)
        } else {
            VStack(alignment: .leading) {
                Text(place.name!)
                Text(place.placemark.formattedAddress ?? "")
                    .font(.caption)
            }.padding(5.0).onTapGesture {
                onSelect(place)
            }
        }
    }
}

// TODO: Enable once you figure out how to mock MKMapItem
//struct PlaceShortDisplayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceShortDisplayView()
//    }
//}
