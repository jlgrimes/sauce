//
//  ContentView.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import Combine
import Amplify
import AuthenticationServices

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
        
        let localUsername: String? = authState.retrieveLocalUsername()
        
        if (localUsername != nil) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: localUsername!) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                    authState.setAuth(username: localUsername!)
                    break // The Apple ID credential is valid.
                case .revoked, .notFound:
                    break;
                default:
                    break
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            if !authState.isLoggedIn() {
                LoginController()
                    .environmentObject(authState)
            } else {
                AppController()
                    .environmentObject(mapState)
                    .environmentObject(placeState)
                    .environmentObject(authState)
            }
        }.onAppear {
            performOnAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
