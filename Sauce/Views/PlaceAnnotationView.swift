//
//  SwiftUIView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct PlaceAnnotationView: View {
  let title: String
    @Binding var bottomSheetShown: Bool
  
  var body: some View {
      VStack {
          Image(systemName: "mappin.circle.fill")
            .font(.title)
            .foregroundColor(.red)
          
          Image(systemName: "arrowtriangle.down.fill")
            .font(.caption)
            .foregroundColor(.red)
            .offset(x: 0, y: -5)
      }.onTapGesture {
          bottomSheetShown.toggle()
      }
  }
}

//struct PlaceAnnotationView_Previews: PreviewProvider {
//  static var previews: some View {
//    PlaceAnnotationView(title: "Empire State Building")
//      .background(Color.gray)
//  }
//}
