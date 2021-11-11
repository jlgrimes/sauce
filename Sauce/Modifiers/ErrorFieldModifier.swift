//
//  ErrorFieldModifier.swift
//  Sauce
//
//  Created by Jared Grimes on 11/10/21.
//

import SwiftUI

struct ErrorFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.red, lineWidth: 4)
                )
    }
    
}
