import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    @StateObject var mapState: MapState = MapState()
    @StateObject var placeState: PlaceState = PlaceState()
    @StateObject var authState: AuthState = AuthState()
    
    func performOnAppear() {
        placeState.fetchPlaces()
    }
    
    var body: some View {
        NavigationView {
            if !authState.isLoggedIn() {
                LoginController()
            } else {
                ZStack {
                    TabView {
                        PlacesViewController(viewType: .mapView)
                            .navigationBarTitle("")
                                .navigationBarHidden(true)
                            .tabItem {
                                Image(systemName: "mappin.circle")
                                Text(MAP_TAB)
                            }
                        Text("Another Tab")
                            .tabItem {
                                Image(systemName: "list.bullet")
                                Text(LIST_TAB)
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
        }
            .environmentObject(mapState)
            .environmentObject(placeState)
            .environmentObject(authState)
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
