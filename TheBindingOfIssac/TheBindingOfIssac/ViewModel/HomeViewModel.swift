//
//  HomeViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 01/12/2022.
//

import Foundation

class HomeViewModel{
    
    private let cards: [CategoryCard] = [
    CategoryCard(imageName: "Character Card", text: "Character Card"),
    CategoryCard(imageName: "Loot Card", text: "Loot Card"),
    CategoryCard(imageName: "Monster Card", text: "Monster Card"),
    CategoryCard(imageName: "Treasure Card", text: "Treasure Card"),
    CategoryCard(imageName: "Bonus Soul", text: "Bonus Soul")
    ]
    
    
    init (){
        
    }
    
    func getCards() -> [CategoryCard]{
        return cards
    }
    
}
