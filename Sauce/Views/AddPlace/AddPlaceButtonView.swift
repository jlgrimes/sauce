//
//  AddPlaceButton.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct AddPlaceButton: View {
    var body: some View {
        VStack {
            Image(systemName: "circle.fill")
                .resizable().frame(width: 60, height: 60)
                .foregroundColor(Color.blue)
                .padding()
                .overlay(Text("+")
                            .foregroundColor(.white)
                            .font(.system(.largeTitle))
                            .padding(.bottom, 6))
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
        }
    }
}

struct AddPlaceButton_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceButton()
    }
}
