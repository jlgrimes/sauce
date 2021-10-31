//
//  PlacesView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/31/21.
//

import SwiftUI

enum PlaceViewType: String {
    case mapView = "MAP_VIEW", listView = "LIST_VIEW"
}

struct PlacesViewController: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden
    var viewType: PlaceViewType
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if (viewType == .mapView) {
                MapViewController(bottomSheetPosition: $bottomSheetPosition)
            }
            
            if bottomSheetPosition == .hidden {
                NavigationLink(
                    destination: AddPlaceView(), // <1>
                    label: {
                        AddPlaceButton()
                    })
            }
        }
    }
}

struct PlacesViewController_Previews: PreviewProvider {
    static var previews: some View {
        PlacesViewController(viewType: .mapView)
    }
}
