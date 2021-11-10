//
//  AddPlaceView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI

struct AddPlaceView: View {
    @Binding var state: AddPlaceState

    var onSubmit: ((AddPlaceState) -> Void)?

    var body: some View {
        Form {
            Section(header: Text(VISIT_INFORMATION_SECTION_LABEL)) {
                DatePicker(DATE_PICKER_LABEL, selection: $state.date)
                
                Picker("", selection: $state.price) {
                    ForEach([1, 2, 3, 4], id: \.self) {
                        Text(String(repeating: "$", count: $0)).tag($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)

                Picker(METHOD_OF_EAT_PICKER_LABEL, selection: $state.methodOfEat) {
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
                        text: $state.cuisineType
                    )
                }
            }
            
            Section(header: Text(ORDER_SECTION_LABEL)) {
                TextEditor(text: $state.order)
                
                VStack {
                    Text(RATING_SLIDER_LABEL)
                    HStack {
                        PlaceAnnotationView(rating: state.rating, hideFeatures: true).padding(.trailing)
                        Slider(
                            value: $state.rating,
                            in: 1...10,
                            step: 1
                        )
                    }
                }
            }
            
            Section(header: Text(THOUGHTS_FIELD_LABEL)) {
                TextEditor(text: $state.otherThoughts)
            }
            
            Section() {
                Button(action: {
                    if self.onSubmit != nil {
                        self.onSubmit!(state)
                    }
                    
                }) {
                    Text(ADD_PLACE_BUTTON_LABEL)
                }
            }
        }.navigationBarTitle(ADD_PLACE_VIEW_NAVIGATION_TITLE)
    }
}

// Uncomment once you add param to function call
// struct AddPlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddPlaceView()
//        }
//    }
//}
