//
//  SauceApp.swift
//  Sauce
//
//  Created by Jared Grimes on 10/27/21.
//

import SwiftUI
import Amplify
import AWSDataStorePlugin

func configureAmplify() {
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
    do {
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        // simplified error handling for the tutorial
        print("Could not initialize Amplify: \(error)")
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
