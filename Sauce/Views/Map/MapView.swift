//
//  MapView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/30/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    var allPlaces: AllPlaces
    @Binding var region: MKCoordinateRegion
    @Binding var selectedPlace: Place
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: true, annotationItems: allPlaces.getPlaces()
        ) { place in
            MapAnnotation(coordinate: place.getPlacemark().coordinate) {
                PlaceAnnotationView(
                    selected: bottomSheetPosition != .hidden && selectedPlace.id == place.id,
                    rating: place.getAverageRating())
                    .onTapGesture {
                        bottomSheetPosition = .bottom
                        selectedPlace = place
                        region.center = selectedPlace.getPlacemark().coordinate
                    }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(allPlaces: SAMPLE_ALL_PLACES, region: .constant(SAMPLE_REGION), selectedPlace: .constant(SAMPLE_PLACE), bottomSheetPosition: .constant(.bottom))
    }
}
