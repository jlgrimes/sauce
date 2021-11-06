//
//  CardModifier.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 3)
    }
    
}
