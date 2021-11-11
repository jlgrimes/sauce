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
    @Binding var invalidCuisineType: Bool
    @Binding var invalidOrder: Bool

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
                
                HStack(spacing: 20) {
                    Text(CUISINE_TYPE_PICKER_LABEL)
                    TextField(
                        "Separate with comma",
                        text: $state.cuisineType
                    )
                }.if(invalidCuisineType) { view in
                    view.modifier(ErrorFieldModifer())
                }
            }
            
            Section(header: Text(ORDER_SECTION_LABEL)) {
                TextField("Ex. Hamburger, baconeggandcheese", text: $state.order).if(invalidOrder) { view in
                    view.modifier(ErrorFieldModifer())
                }
                
                HStack {
                    Text(RATING_SLIDER_LABEL).padding(.trailing)
                    PlaceAnnotationView(rating: state.rating, hideFeatures: true).padding(.trailing)
                    Slider(
                        value: $state.rating,
                        in: 1...10,
                        step: 1
                    )
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
