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
    var onSubmit: ((Date, Int, MethodOfEat, [String], String, Float, String) -> Void)?

    var body: some View {
        Form {
            Section(header: Text(VISIT_INFORMATION_SECTION_LABEL)) {
                DatePicker(DATE_PICKER_LABEL, selection: $date)
                
                Picker("", selection: $price) {
                    ForEach([1, 2, 3, 4], id: \.self) {
                        Text(String(repeating: "$", count: $0)).tag($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)

                Picker(METHOD_OF_EAT_PICKER_LABEL, selection: $methodOfEat) {
                    ForEach([MethodOfEat.dineIn, MethodOfEat.eatAt, MethodOfEat.pickup, MethodOfEat.delivery], id: \.self) {
                        Text(METHOD_OF_EAT_PICKER_OPTIONS[$0]).tag($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)
                
                HStack(spacing: 80) {
                    Text(CUISINE_TYPE_PICKER_LABEL)
                    TextField(
                        "Cuisine type (separate with comma)",
                        text: $cuisineType
                    )
                }
            }
            
            Section(header: Text(ORDER_SECTION_LABEL)) {
                TextEditor(text: $order)
                
                VStack {
                    Text(RATING_SLIDER_LABEL)
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
            
            Section(header: Text(THOUGHTS_FIELD_LABEL)) {
                TextEditor(text: $otherThoughts)
            }
            
            Section() {
                Button(action: {
                    if self.onSubmit != nil {
                        self.onSubmit!(date, price, methodOfEat, cuisineType.components(separatedBy: ","), order, rating, otherThoughts)
                    }
                    
                }) {
                    Text(ADD_PLACE_BUTTON_LABEL)
                }
            }
        }.navigationBarTitle(ADD_PLACE_VIEW_NAVIGATION_TITLE)
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
