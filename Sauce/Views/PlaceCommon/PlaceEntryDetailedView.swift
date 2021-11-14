//
//  PlaceEntryDetailedView.swift
//  Sauce
//
//  Created by Jared Grimes on 11/10/21.
//

import SwiftUI

struct PlaceEntryDetailedView: View {
    let placeEntry: PlaceEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(placeEntry.time, style: .date).font(.largeTitle)
                Text(placeEntry.place.name).font(.headline)
            }.padding(.bottom, 20)
            HStack {
                PlaceAnnotationView(selected: false, rating: Float(placeEntry.rating), hideFeatures: true)
                Text(placeEntry.order)
            }
        }
    }
}

struct PlaceEntryDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceEntryDetailedView(placeEntry: SAMPLE_PLACE_ENTRY)
    }
}
