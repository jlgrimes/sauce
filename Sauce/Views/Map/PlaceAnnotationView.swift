//
//  SwiftUIView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct PlaceAnnotationView: View {
    var selected: Bool = false
    var rating: Int = -1
    
    func getSize() -> CGFloat {
        if selected {
            return 40
        }
        
        return 30
    }
    
    func getColor() -> Color {
        if rating == -1 {
            return .red
        }
        
        return Color(rgb: RATING_COLORS[rating - 1])
    }
    
    func getNumberString() -> String {
        if rating == -1 {
            return ""
        }
        
        return String(rating)
    }
    
    var body: some View {
      VStack {
          Image(systemName: "circle.fill")
              .resizable().frame(width: self.getSize(), height: self.getSize())
            .font(.title)
            .foregroundColor(getColor())
            .overlay(Text(getNumberString())
                        .font(.headline)
                        .foregroundColor(.white))
            .scaleEffect()
          
          Image(systemName: "arrowtriangle.down.fill")
            .font(.caption)
            .foregroundColor(getColor())
            .offset(x: 0, y: -5)
      }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
      VStack {
          HStack {
              ForEach(0..<RATING_COLORS.count) { index in
                  PlaceAnnotationView(rating: index + 1)
              }
          }
          HStack {
              PlaceAnnotationView()
              PlaceAnnotationView(selected: true)
          }
      }
  }
}
