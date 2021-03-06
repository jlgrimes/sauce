//
//  PlaceSearchController.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI
import CoreLocation
import MapKit

struct PlaceSearchController: View {
    // Bounds are the entire world
    @State var boundingRegion: MKCoordinateRegion = MKCoordinateRegion(MKMapRect.world)
    
    @State var places: [MKMapItem]? {
        didSet {
            // tableView.reloadData()
            // viewAllButton.isEnabled = places != nil
        }
    }
    
    @State var queryString: String = ""
    @State var resultsLoading: Bool = false
    
    @State var localSearch: MKLocalSearch? {
        willSet {
            // Clear the results and cancel the currently running local search before starting a new search.
            places = nil
            localSearch?.cancel()
        }
    }
    
    var onSelect: (MKMapItem) -> Void
    
    // Used for going back in parent
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    /// - Parameter queryString: A search string from the text the user entered into `UISearchBar`
    func search(queryString: String) -> Void {
        resultsLoading = true
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = queryString
        search(using: searchRequest)
    }

    func search(using searchRequest: MKLocalSearch.Request) {
        // Confine the map search area to an area around the user's current location.
        searchRequest.region = boundingRegion

        // Include only point of interest results. This excludes results based on address matches.
        searchRequest.resultTypes = .pointOfInterest

        localSearch = MKLocalSearch(request: searchRequest)
        localSearch?.start { [self] (response, error) in
            resultsLoading = false
            guard error == nil else {
                // self.displaySearchError(error)
                return
            }

            self.places = response?.mapItems

            // Used when setting the map's region in `prepareForSegue`.
            if let updatedRegion = response?.boundingRegion {
                self.boundingRegion = updatedRegion
            }
        }
    }

    var body: some View {
        PlaceSearchView(onChange: self.search, places: $places, resultsLoading: $resultsLoading, onSelect: { place in
                onSelect(place)
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
}

struct PlaceSearchController_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSearchController(onSelect: void)
    }
}
