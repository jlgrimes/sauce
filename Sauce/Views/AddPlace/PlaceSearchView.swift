//
//  PlaceSearch.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI

struct PlaceSearch: View {
    @Binding var searchItems: Array<String>
    @Binding var value: String
    @Binding var onChange: () -> String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct PlaceSearch_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceSearch()
//    }
//}
