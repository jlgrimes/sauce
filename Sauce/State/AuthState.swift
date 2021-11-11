//
//  PlaceState.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation
import Amplify
import AuthenticationServices

final class AuthState: ObservableObject {
    @Published var username: String?

    func setAuth(auth: ASAuthorization) {
        let credentials = auth.credential as? ASAuthorizationAppleIDCredential
        self.username = credentials?.user
        
        let defaults = UserDefaults.standard
        defaults.set(getUserId(), forKey: "userLoggedIn")
    }
    
    func setAuth(username: String) {
        self.username = username
    }
    
    func retrieveLocalUsername() -> String? {
        let defaults = UserDefaults.standard
        if let username = defaults.string(forKey: "userLoggedIn") {
            return username
        }
        
        return nil
    }
    
    func isLoggedIn() -> Bool {
        return username != nil
    }
    
    func getUserId() -> String {
        return username ?? ""
    }
}
