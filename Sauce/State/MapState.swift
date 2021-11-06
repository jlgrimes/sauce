//
//  MapState.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation

final class MapState: ObservableObject {
    @Published var bottomSheetPosition: BottomSheetPosition
    @Published var selectedPlace: Place
    
    init() {
        bottomSheetPosition = .hidden
        selectedPlace = SAMPLE_PLACE
    }
}
