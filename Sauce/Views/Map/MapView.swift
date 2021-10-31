//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    var places: Array<Place>
    @Binding var region: MKCoordinateRegion
    @Binding var selectedPlace: Place
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: places
        ) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView(
                    selected: bottomSheetPosition != .hidden && selectedPlace.id == place.id,
                    rating: place.rating)
                    .onTapGesture {
                        bottomSheetPosition = .bottom
                        selectedPlace = place
                        region.center = selectedPlace.coordinate
                    }
            }
        }.bottomSheet(
            bottomSheetPosition: self.$bottomSheetPosition,
            options: [
                .noDragIndicator,
                .swipeToDismiss
            ],
            headerContent: {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(selectedPlace.name)
                            .font(.title)
                            .bold()
                            // Allows text overflow to happen
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        PlaceAnnotationView(rating: selectedPlace.rating, hideFeatures: true)
                    }
                    HStack {
                        Text(selectedPlace.cuisine)
                        Text(String(repeating: "$", count: selectedPlace.price))
                    }
                }
        }) {
            Text("hi")
        }.navigationBarHidden(true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(places: SAMPLE_PLACES, region: .constant(SAMPLE_REGION), selectedPlace: .constant(SAMPLE_PLACES[1]), bottomSheetPosition: .constant(.bottom))
    }
}
