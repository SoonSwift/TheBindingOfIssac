//
//  HomeViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 01/12/2022.
//

import Foundation

class HomeViewModel: ObservableObject{
    
   
    @Published var showMenu = false
    
    private let cards: [CategoryCard] = [
        CategoryCard(imageName: "Character Card", text: "Character Card",type: .Character),
        CategoryCard(imageName: "Loot Card", text: "Loot Card", type: .Loot),
        CategoryCard(imageName: "Monster Card", text: "Monster Card", type: .Monster),
        CategoryCard(imageName: "Treasure Card", text: "Treasure Card", type: .Treasure),
        CategoryCard(imageName: "Bonus Soul", text: "Bonus Soul", type: .Bonus)
    ]
    
    private let menuImage = "FourSoulsLogo"
    
    
    
    init (){
        
    }
    
    func getCards() -> [CategoryCard]{
        return cards
    }
    
    func getMenuImage() -> String{
        return menuImage
    }
    
}
