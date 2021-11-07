import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    @StateObject var mapState: MapState = MapState()
    @StateObject var placeState: PlaceState = PlaceState()
    
    func performOnAppear() {
        placeState.fetchPlaces()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    PlacesViewController(viewType: .mapView)
                        .navigationBarTitle("")
                            .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "mappin.circle")
                            Text("Map")
                        }
                    Text("Another Tab")
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("List")
                        }
                    Text("The Last Tab")
                        .tabItem {
                            Image(systemName: "3.square.fill")
                            Text("Third")
                        }
                }
                .font(.headline)
                .bottomSheet(
                    bottomSheetPosition: $mapState.bottomSheetPosition,
                    options: [
                        .noDragIndicator,
                        .swipeToDismiss
                    ],
                    headerContent: {
                        PlaceSheetContentView(place: mapState.selectedPlace)
                    }) {
                }
            }
        }
            .environmentObject(mapState)
            .environmentObject(placeState)
            .onAppear {
                performOnAppear()
            }
    }
}

struct AppController_Previews: PreviewProvider {
    static var previews: some View {
        AppController().environmentObject(MapState())
    }
}
