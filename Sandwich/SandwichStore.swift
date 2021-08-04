//
//  SandwichStore.swift
//  Sandwich
//
//  Created by Toseef on 8/3/21.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]

    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testSandwiches)
