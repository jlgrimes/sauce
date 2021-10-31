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
    
    private var localSearch: MKLocalSearch? {
        willSet {
            // Clear the results and cancel the currently running local search before starting a new search.
            places = nil
            localSearch?.cancel()
        }
    }
    
    private mutating func search(using searchRequest: MKLocalSearch.Request) {
        // Confine the map search area to an area around the user's current location.
        searchRequest.region = boundingRegion
        
        // Include only point of interest results. This excludes results based on address matches.
        searchRequest.resultTypes = .pointOfInterest
        
        localSearch = MKLocalSearch(request: searchRequest)
        localSearch?.start { [self] (response, error) in
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlaceSearchController_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSearchController()
    }
}
