//
//  AddPlaceButton.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct AddPlaceButton: View {
    var body: some View {
        Button(action: {
        }, label: {
            Text("+")
            .font(.system(.largeTitle))
            .frame(width: 67, height: 60
            )
            .foregroundColor(Color.white)
            .padding(.bottom, 7)
        })
        .background(Color.blue)
        .cornerRadius(38.5)
        .padding()
        .shadow(color: Color.black.opacity(0.3),
                radius: 3,
                x: 3,
                y: 3)
    }
}

struct AddPlaceButton_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceButton()
    }
}
