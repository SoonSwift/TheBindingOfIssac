//
//  HomeViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 01/12/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var showMenu = false
    
    let cardCategories: [CategoryCard] = [
        CategoryCard(imageName: "Character Card", text: "Character Card", type: .character),
        CategoryCard(imageName: "Loot Card", text: "Loot Card", type: .loot),
        CategoryCard(imageName: "Monster Card", text: "Monster Card", type: .monster),
        CategoryCard(imageName: "Treasure Card", text: "Treasure Card", type: .treasure),
        CategoryCard(imageName: "Bonus Soul", text: "Bonus Soul", type: .bonus)
    ]
    
    let menuImage = "FourSoulsLogo"
}
