import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    @EnvironmentObject var mapState: MapState
    @EnvironmentObject var placeState: PlaceState
    @EnvironmentObject var authState: AuthState
    
    func performOnAppear() {
        placeState.fetchPlaces(userId: authState.getUserId())
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
