//
//  Store.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation

struct AppState {
    var bottomSheetPosition: BottomSheetPosition
    var selectedMapPlace: Place
    
    init() {
        bottomSheetPosition = .hidden
        selectedMapPlace = SAMPLE_PLACE
    }
}
