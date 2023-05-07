//
//  CategoryCard.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 01/12/2022.
//

struct CategoryCard {
    let imageName: String
    let text: String
    let type: CardType
}

enum CardType: String, Hashable, Codable {
    case character = "Character"
    case monster = "MonsterCard"
    case bonus = "BonusSoul"
    case loot = "LootCrad"
    case treasure = "Treasure"
    case startingItem = "StartingIteam"
}
