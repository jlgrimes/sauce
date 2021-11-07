//
//  PlaceSheetHeaderView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import MapKit

struct PlaceSheetHeaderView: View {
    var place: Place

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(place.name)
                    .font(.title)
                    .bold()
                    // Allows text overflow to happen
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                PlaceAnnotationView(rating: place.getAverageRating(), hideFeatures: true)
            }
            HStack {
                Text(place.getCuisineTypes())
                Text(String(repeating: "$", count: place.getAveragePrice()))
            }
            Button(action: {
                place.getMapItem().openInMaps()
            }) {
                Text(GET_DIRECTIONS)
            }
        }
    }
}

struct PlaceSheetHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSheetHeaderView(place: SAMPLE_PLACE)
    }
}
