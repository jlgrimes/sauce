//
//  PlaceEntryListView.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import SwiftUI

struct PlaceEntryListView: View {
    var place: Place
    
    var body: some View {
        VStack {
            ForEach(place.placeEntries) { placeEntry in
                PlaceEntryView(placeEntry: placeEntry)
            }
        }
    }
}

struct PlaceEntryListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceEntryListView(place: SAMPLE_PLACE)
    }
}
