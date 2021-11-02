//
//  AddPlaceView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct AddPlaceView: View {
    // TODO: Remove defaults and implement input validation
    @State var date: Date = Date()
    @State var price: Int = 1
    @State var methodOfEat: MethodOfEat = .dineIn
    @State var cuisineType: String = ""
    @State var order: String = ""
    @State var rating: Float = 5.0
    @State var otherThoughts: String = ""
    var onSubmit: ((Date, Int, MethodOfEat, String, String, Float, String) -> Void)?

    var body: some View {
        Form {
            Section(header: Text("Visit information")) {
                DatePicker("Date", selection: $date)
                
                Picker("", selection: $price) {
                    ForEach([1, 2, 3, 4], id: \.self) {
                        Text(String(repeating: "$", count: $0)).tag($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)

                Picker("Method of Eat", selection: $methodOfEat) {
                    ForEach([MethodOfEat.dineIn, MethodOfEat.eatAt, MethodOfEat.pickup, MethodOfEat.delivery], id: \.self) {
                        Text(METHOD_OF_EAT_PICKER_OPTIONS[$0]).tag($0)
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
            
            Section(header: Text("Order")) {
                TextEditor(text: $order)
                
                VStack {
                    Text("Rating")
                    HStack {
                        PlaceAnnotationView(rating: rating, hideFeatures: true).padding(.trailing)
                        Slider(
                            value: $rating,
                            in: 1...10,
                            step: 1
                        )
                    }
                }
            }
            
            Section(header: Text("Other thoughts")) {
                TextEditor(text: $otherThoughts)
            }
            
            Section() {
                Button(action: {
                    if self.onSubmit != nil {
                        self.onSubmit!(date, price, methodOfEat, cuisineType, order, rating, otherThoughts)
                    }
                    
                }) {
                    Text("Add new place")
                }
            }
        }.navigationBarTitle("Add new place")
    }
}

// Uncomment once you have added void for this new type
 struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPlaceView()
        }
    }
}
