//
//  ListCardViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import SwiftUI

extension ListCardView {
    class ListCardViewModel: ObservableObject {
        private var allCards: [Cards]
        
        @Published var searchText = ""
        
        @Published var selectedImage: ImageWrapper? = nil
        
        @Published var cards: [Cards] = []
        
        let type: CardType
        
        init(type: CardType) {
            self.type = type
            let loadedCards: [Cards] = Bundle.main.decode("JSON_data.json")
            allCards = loadedCards.filter { $0.cardType == type }
        }
        
        func reloadData() {
            self.cards = self.allCards
            .filter {
                searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
