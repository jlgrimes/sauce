//
//  PlaceSheetHeaderView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI

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
                PlaceAnnotationView(rating: place.rating, hideFeatures: true)
            }
            HStack {
                Text(place.cuisine)
                Text(String(repeating: "$", count: place.price))
            }
        }
    }
}

struct PlaceSheetHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSheetHeaderView(place: SAMPLE_PLACES[0])
    }
}
