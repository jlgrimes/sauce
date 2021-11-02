//
//  SwiftUIView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct PlaceAnnotationView: View {
    var selected: Bool = false
    var rating: Float = 5.0
    var hideFeatures: Bool = false
    
    func getSize() -> CGFloat {
        if selected {
            return 40
        }
        
        return 30
    }
    
    func getColor() -> Color {
        return Color(rgb: getColorFromRating(rating: rating))
    }
    
    func getNumberString() -> String {
        if (rating.truncatingRemainder(dividingBy: 1) == 0) {
            return String(Int(rating))
        }
        
        return String(rating)
    }
    
    func getTextSize() -> CGFloat {
        if selected {
            return 20
        }
        
        return 16
    }
    
    func getShadowOpacity() -> CGFloat {
        if hideFeatures {
            return 0
        }
        
        if selected {
            return 0.4
        }
        
        return 0.2
    }
    
    var body: some View {
      VStack {
          Image(systemName: "circle.fill")
              .resizable().frame(width: self.getSize(), height: self.getSize())
            .foregroundColor(getColor())
            .overlay(Text(getNumberString())
                        .foregroundColor(.white)
                        .font(.system(size: getTextSize(), weight: .bold)))
            .scaleEffect()
            .shadow(color: Color.black.opacity(getShadowOpacity()),
                    radius: 3,
                    x: 3,
                    y: 3)
          
          if !hideFeatures {
              Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(getColor())
                .offset(x: 0, y: -5)
          }
      }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
      VStack {
          HStack {
              ForEach(0..<RATING_COLORS.count) { index in
                  PlaceAnnotationView(rating: Float(index + 1))
              }
          }
          HStack {
              PlaceAnnotationView()
              PlaceAnnotationView(rating: 5.5)
              PlaceAnnotationView(selected: true)
              PlaceAnnotationView(hideFeatures: true)
          }
      }
  }
}
