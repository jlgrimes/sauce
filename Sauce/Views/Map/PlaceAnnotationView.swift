//
//  SwiftUIView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct PlaceAnnotationView: View {
    var selected: Bool
    
    init() {
        selected = false
    }
    
    init(selected: Bool) {
        self.selected = selected
    }
    
    func getSize() -> CGFloat {
        if selected {
            return 40
        }
        
        return 30
    }
    
    var body: some View {
      VStack {
          Image(systemName: "mappin.circle.fill")
              .resizable().frame(width: self.getSize(), height: self.getSize())
            .font(.title)
            .foregroundColor(.red)
            .scaleEffect()
          
          Image(systemName: "arrowtriangle.down.fill")
            .font(.caption)
            .foregroundColor(.red)
            .offset(x: 0, y: -5)
      }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
      HStack {
          PlaceAnnotationView()
          PlaceAnnotationView(selected: true)
      }
  }
}
