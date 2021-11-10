//
//  PlaceEntryView.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import SwiftUI

struct PlaceEntryView: View {
    var placeEntry: PlaceEntry
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            PlaceAnnotationView(rating: Float(placeEntry.rating), hideFeatures: true)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(placeEntry.time, style: .date).font(.caption)
                    Text(placeEntry.method?.rawValue).font(.caption)
                }
                Text(placeEntry.order)
            }
            
            Spacer()
        }
        .padding(.all, 15)
        .background(Color(UIColor.systemBackground))
        .modifier(CardModifier())
    }
}

struct PlaceEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceEntryView(placeEntry: SAMPLE_PLACE_ENTRY)
    }
}
