//
//  SandwichApp.swift
//  Sandwich
//
//  Created by Toseef on 7/30/21.
//

import SwiftUI

@main
struct SandwichApp: App {
    @StateObject private var store = SandwichStore(sandwiches: testSandwiches)

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
