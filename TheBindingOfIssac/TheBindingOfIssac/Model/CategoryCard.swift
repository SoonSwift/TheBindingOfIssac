//
//  CategoryCard.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 01/12/2022.
//

import Foundation

struct CategoryCard{
    let imageName: String
    let text: String
    let type: CardType
    
}

enum CardType{
    case Character,Monster,Bonus,Loot,Treasure
}
