//
//  ListCardView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import SwiftUI

struct ListCardView: View {
    
    var viewModel = ListCardViewModel()
    
  // poprawic klase na main actora w klasie !!!
  // nie moge dac tego do class nw czemu
   @State private var images = [URL: UIImage]()

    // jak to zmeinic zebt bylo w klasie?
    var type: String
    

    // czemu to nie moze byc tutaj tylko musi zostac stworzone nizej?
    
   // let sortedCards = viewModel.cards.filter { $0.cardType.contains(type)}


    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: viewModel.colums){
                
                let sortedCards = viewModel.cards.filter { $0.cardType.contains(type)}

                ForEach(sortedCards, id: \.self){ card in
                        
                    
                        if let image = self.images[card.link]{
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "photo")
                                .onAppear {
                                    URLSession.shared.dataTask(with: card.link){ data , response , error in
                                        guard error == nil, let data = data else {return}
                                        
                                        
                                        let image = UIImage(data: data)
                                        self.images[card.link] = image
                                    } .resume()
                                }
                        }
                        
                        
                }
            }
        
        }
        .navigationTitle(type)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
   
    
}

    


struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(type: "MonsterCard")
    }
}
