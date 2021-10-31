import SwiftUI
import MapKit
import BottomSheet

struct AppController: View {
    var body: some View {
        NavigationView {
            TabView {
                PlacesViewController(viewType: .mapView)
                    .badge(10)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                Text("Another Tab")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
            }
            .font(.headline)
        }.navigationBarHidden(true)
    }
}

struct AppController_Previews: PreviewProvider {
    static var previews: some View {
        AppController()
    }
}
