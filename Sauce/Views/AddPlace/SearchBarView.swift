//
//  SearchBarView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var value: String
    var onChange: (String) -> Void
    
    var body: some View {
        TextField(
            "Search for a place",
            text: $value
        ).padding().onChange(of: value, perform: { newValue in
            onChange(newValue)
        })
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(value: .constant(""), onChange: void)
    }
}
