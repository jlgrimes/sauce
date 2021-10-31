import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    PlacesViewController(viewType: .mapView)
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
                .zIndex(1)
                .font(.headline)
            }
        }.navigationBarHidden(true)
    }
}

struct AppController_Previews: PreviewProvider {
    static var previews: some View {
        AppController()
    }
}
