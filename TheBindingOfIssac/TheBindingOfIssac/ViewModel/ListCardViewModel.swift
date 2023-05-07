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
        private var images = [URL: UIImage]()
        
        @Published var searchText = ""
        
        @Published var isLoading = true
        
        @Published var selectedImage: ImageWrapper? = nil
        
        @Published var cards: [CardViewModel] = []
        
        let type: CardType
        
        init(type: CardType) {
            self.type = type
            let loadedCards: [Cards] = Bundle.main.decode("JSON_data.json")
            allCards = loadedCards.filter { $0.cardType == type }
        }
        
        func fetchCards() {
            for card in allCards {
                URLSession.shared.dataTask(with: card.link) { [weak self]  data, response, error in
                    guard error == nil, let data, let self else { return }
                    
                    let image = UIImage(data: data)
                    self.images[card.link] = image
                    
                    if self.images.count == self.allCards.count {
                        DispatchQueue.main.async {
                            self.reloadData()
                            self.isLoading = false
                        }
                    }
                }
                .resume()
            }
        }
        
        func reloadData() {
            self.cards = self.allCards.map {
                CardViewModel(name: $0.name,
                              image: images[$0.link])
            }
            .filter {
                searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
