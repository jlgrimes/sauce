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
    @Published var auth: ASAuthorization?
    
    func setAuth(auth: ASAuthorization) {
        self.auth = auth
    }
    
    func isLoggedIn() -> Bool {
        return auth != nil
    }
    
    func getUserId() -> String {
        let credentials = auth?.credential as? ASAuthorizationAppleIDCredential
        return credentials?.user ?? ""
    }
}
