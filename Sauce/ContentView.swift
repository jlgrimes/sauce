//
//  ContentView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import Combine
import Amplify

struct ContentView: View {
    @State var todoSubscription: AnyCancellable?
    
    @StateObject var mapState: MapState = MapState()
    @StateObject var placeState: PlaceState = PlaceState()
    @StateObject var authState: AuthState = AuthState()
    
    func subscribeEntries() {
        self.todoSubscription
            = Amplify.DataStore.publisher(for: Entry.self)
                .sink(receiveCompletion: { completion in
                    print("Subscription has been completed: \(completion)")
                }, receiveValue: { mutationEvent in
                    print("Subscription got this value: \(mutationEvent)")

                    do {
                      let placeEntry = try mutationEvent.decodeModel(as: Entry.self)

                      switch mutationEvent.mutationType {
                      case "create":
                        print("Created: \(placeEntry)")
                      case "update":
                        print("Updated: \(placeEntry)")
                      case "delete":
                        print("Deleted: \(placeEntry)")
                      default:
                        break
                      }

                    } catch {
                      print("Model could not be decoded: \(error)")
                    }
                })
    }
    
    func performOnAppear() {
        subscribeEntries()
    }
    
    var body: some View {
        if !authState.isLoggedIn() {
            LoginController()
                .environmentObject(authState)
        } else {
            AppController()
                .environmentObject(mapState)
                .environmentObject(placeState)
                .environmentObject(authState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
