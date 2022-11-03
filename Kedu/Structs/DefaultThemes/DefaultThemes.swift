//
//  DefaultThemes.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-05-07.
//


import SwiftUI

struct DefaultThemes {

    static let theme0 = ThemeCollection.Theme (
        name: "Fruits in Basket",
        accentColor: UIColor(Color.pink),
        imageNameSet: ["1", "2", "3", "4", "5", "6"]
    )
    
    static let theme1 = ThemeCollection.Theme (
        name: "Animals in Zoo",
        accentColor: UIColor(Color.orange),
        imageNameSet: ["5", "6", "7", "8", "1","9"]
    )
//    
//    static let theme2 = ThemeCollection.Theme (
//        name: "Balls on Playground",
//        accentColor: UIColor(Color.yellow),
//        imageNameSet: ["1m", "2", "3", "4"]
//    )
}
