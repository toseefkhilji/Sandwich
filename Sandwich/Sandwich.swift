//
//  Sandwich.swift
//  Sandwich
//
//  Created by Toseef on 7/30/21.
//

import Foundation

struct Sandwich: Identifiable {

    var id = UUID()
    let name: String
    let ingrediantCount: Int
    var isSpicy: Bool = false
    let imageName: String
    var isFavourite: Bool = false

}

let testSandwiches = [
    Sandwich(name: "Club", ingrediantCount: 3, imageName: "Sandwich_0"),
    Sandwich(name: "Bacon", ingrediantCount: 5, imageName: "Sandwich_1"),
    Sandwich(name: "Roast Beef", ingrediantCount: 3, imageName: "Sandwich_2", isFavourite: true),
    Sandwich(name: "Turkey", ingrediantCount: 3, isSpicy: true , imageName: "Sandwich_3", isFavourite: true),
    Sandwich(name: "Grilled Chicken", ingrediantCount: 3, imageName: "Sandwich_4"),
    Sandwich(name: "Hot Dog", ingrediantCount: 4, imageName: "Sandwich_5"),
    Sandwich(name: "Grilled Cheese", ingrediantCount: 2, isSpicy: true, imageName: "Sandwich_6")
]

