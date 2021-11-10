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
    @State var addPlaceState: AddPlaceState = AddPlaceState()
    @EnvironmentObject var placeState: PlaceState
    @EnvironmentObject var authState: AuthState
    
    // Used for going back in parent
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func onSubmit(state: AddPlaceState) {
        if !addPlaceState.validateState() {
            return;
        }
        
        do {
            presentationMode.wrappedValue.dismiss()
            
            let coordinate: [Double?] = [
                addPlaceState.selectedPlace?.placemark.coordinate.latitude,
                addPlaceState.selectedPlace?.placemark.coordinate.longitude
            ]
            let placeData = PlaceData(coordinate: coordinate, name: (addPlaceState.selectedPlace?.name)!)
            let item = Entry(id: UUID().uuidString, userID: authState.getUserId(), time: try Temporal.DateTime(iso8601String: state.date.ISO8601Format()), place: placeData, order: addPlaceState.order, rating: Int(addPlaceState.rating), cuisine: addPlaceState.cuisineType.components(separatedBy: ","), price: addPlaceState.price, method: addPlaceState.methodOfEat, thoughts: addPlaceState.otherThoughts)
            
            Amplify.DataStore.save(item) { result in
                       switch(result) {
                       case .success(let savedItem):
                           placeState.fetchPlaces(userId: authState.getUserId())
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
                addPlaceState.setSelectedPlace(place: place)
            }).navigationBarTitle("Search")) {
                if (addPlaceState.selectedPlace == nil) {
                    SearchBarView(value: .constant(""), onChange: void)
                } else {
                    PlaceShortDisplayView(place: addPlaceState.selectedPlace).allowsHitTesting(false)
                }
            }
            AddPlaceView(state: $addPlaceState, onSubmit: self.onSubmit)
        }
    }
}

struct AddPlaceController_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPlaceController().environmentObject(PlaceState())
        }
    }
}
