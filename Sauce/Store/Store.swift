//
//  Store.swift
//  Sauce
//
//  Created by Jared Grimes on 11/6/21.
//

import Foundation

typealias AppStore = Store

final class Store: ObservableObject {
    @Published var state: AppState
    
    init() {
        self.state = AppState()
    }
    
    init(appState: AppState) {
        self.state = appState
    }
}
