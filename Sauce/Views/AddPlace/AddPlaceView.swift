//
//  AddPlaceView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct AddPlaceView: View {
    @State var date: Date = Date()
    @State var price: String = ""
    @State var methodOfEat: String = ""
    @State var cuisineType: String = ""
    @State var rating = 5.0
    @State var otherThoughts: String = ""

    var body: some View {
        Form {
            Section(header: Text("Visit information")) {
                DatePicker("Date", selection: $date)
                
                Picker("", selection: $price) {
                    ForEach(["$", "$$", "$$$", "$$$$"], id: \.self) {
                        Text($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)

                Picker("", selection: $methodOfEat) {
                    ForEach(["Dine in", "Dine at", "Pickup", "Delivery"], id: \.self) {
                        Text($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)
                
                HStack(spacing: 80) {
                    Text("Cuisine type")
                    Picker("Type of Food", selection: $cuisineType) {
                        ForEach(["American", "Mexican", "Boba", "Sushi", "Pizza", "Italian", "Cuban"], id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            
            Section(header: Text("Rating")) {
                HStack {
                    PlaceAnnotationView(rating: Int(rating), hideFeatures: true).padding(.trailing)
                    Slider(
                        value: $rating,
                        in: 1...10,
                        step: 1
                    )
                }
            }
            
            Section(header: Text("Other thoughts")) {
                TextEditor(text: $otherThoughts)
            }
            
            Section() {
                Button("Add new place") {
                    
                }
            }
        }.navigationBarTitle("Add new place")
    }
}

struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPlaceView()
        }
    }
}
