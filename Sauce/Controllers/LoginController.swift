//
//  LoginController.swift
//  Sauce
//
//  Created by Jared Grimes on 11/8/21.
//

import SwiftUI
import AuthenticationServices

struct LoginController: View {
    @EnvironmentObject var authState: AuthState
    
    var body: some View {
        VStack {
            Text("Delish - your favorite food app!").font(.title)
            SignInWithAppleButton(.signIn,
                         onRequest: { request in
                             request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    authState.setAuth(auth: authResults)
                      print("Authorization successful.")
                   case .failure(let error):
                      print("Authorization failed: " + error.localizedDescription)
            }
            }).frame(width: 200, height: 30)
        }
    }
}

struct LoginController_Previews: PreviewProvider {
    static var previews: some View {
        LoginController()
    }
}
