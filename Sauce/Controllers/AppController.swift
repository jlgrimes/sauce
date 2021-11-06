import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    @StateObject var store: AppStore = AppStore()
    
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
                    bottomSheetPosition: $store.state.bottomSheetPosition,
                    options: [
                        .noDragIndicator,
                        .swipeToDismiss
                    ],
                    headerContent: {
                        PlaceSheetContentView(place: store.state.selectedMapPlace)
                    }) {
                }
            }
        }.environmentObject(store)
    }
}

struct AppController_Previews: PreviewProvider {
    static var previews: some View {
        AppController().environmentObject(AppStore())
    }
}
