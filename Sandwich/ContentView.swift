//
//  ContentView.swift
//  Sandwich
//
//  Created by Toseef on 8/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    @State var selection: String = "list"

    var body: some View {
        TabView (selection: $selection) {
            SandwichListView(store: store)
                .tabItem {
                    Label("List", systemImage: "square.fill.text.grid.1x2")
                }.tag("list")

            SandwichGallary(store: store)
                .tabItem {
                    Label("Gallery", systemImage: "square.grid.2x2.fill")
                }.tag("gallery")
        }
        .onOpenURL { url in
            print("Received deep link: \(url)")
            if let host = url.host {
                self.selection = host
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(store: testStore)
    }
}
