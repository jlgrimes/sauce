//
//  Map.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import Foundation
import SwiftUI

enum BottomSheetPosition: CGFloat, CaseIterable {
    case high = 0.8, bottom = 0.25, hidden = 0
}

var RATING_COLORS = [
    0x6a040f,
    0x9d0208,
    0xd00000,
    0xdc2f02,
    0xe85d04,
    0xf48c06,
    0xfaa307,
    0xffba08,
    0xffd166,
    0x06d6a0
];

func getColorFromRating(rating: Int) -> Int {
    guard rating >= 1 && rating <= 10 else {
        return 0
    }
    
    return RATING_COLORS[rating - 1]
}
