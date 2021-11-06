//
//  PlaceSheetContentView.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import SwiftUI

struct PlaceSheetContentView: View {
    var place: Place
    
    var body: some View {
        VStack {
            PlaceSheetHeaderView(place: place)
            PlaceEntryListView(place: place)
            Spacer()
        }
    }
}

struct PlaceSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSheetContentView(place: SAMPLE_PLACE)
    }
}
