//
//  SauceApp.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import Amplify
import AWSDataStorePlugin
import AWSAPIPlugin
import AWSCognitoAuthPlugin

func configureAmplify() {
    let models = AmplifyModels()
    let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
    // let authPlugin = AWSCognitoAuthPlugin()
    do {
        try Amplify.add(plugin: apiPlugin)
        try Amplify.add(plugin: dataStorePlugin)
        // try Amplify.add(plugin: authPlugin)
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        assert(false, "Could not initialize Amplify: \(error)")
    }
}

@main
struct SauceApp: App {
    // add a default initializer and configure Amplify
    public init() {
        configureAmplify()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
