//
//  AddPlaceController.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import MapKit
import Amplify

struct AddPlaceController: View {
    @State var selectedPlace: MKMapItem?
    
    func onSubmit(date: Date, price: Int, methodOfEat: MethodOfEat, cuisineType: String, order: String, rating: Float, otherThoughts: String) {
        do {
            let coordinate: [Double?] = [
                selectedPlace?.placemark.coordinate.latitude,
                selectedPlace?.placemark.coordinate.longitude
            ]
            let placeData = PlaceData(coordinate: coordinate, name: selectedPlace?.name ?? "")
            let item = Entry(id: UUID().uuidString, userID: "jeff", time: try Temporal.DateTime(iso8601String: date.ISO8601Format()), place: placeData, order: order, rating: Int(rating), cuisine: cuisineType, price: price, method: methodOfEat, thoughts: otherThoughts)
            
            Amplify.DataStore.save(item) { result in
                       switch(result) {
                       case .success(let savedItem):
                           print("Saved item: \(savedItem.id)")
                       case .failure(let error):
                           print("Could not save item to DataStore: \(error)")
                       }
                    }
        } catch {
            print("oh no our app its broken")
        }
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: PlaceSearchController(onSelect: { place in
                    selectedPlace = place
            }).navigationBarTitle("Search")) {
                if (selectedPlace == nil) {
                    SearchBarView(value: .constant(""), onChange: void)
                } else {
                    PlaceShortDisplayView(place: selectedPlace).allowsHitTesting(false)
                }
            }
            AddPlaceView(onSubmit: self.onSubmit)
        }
    }
}

struct AddPlaceController_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPlaceController()
        }
    }
}
