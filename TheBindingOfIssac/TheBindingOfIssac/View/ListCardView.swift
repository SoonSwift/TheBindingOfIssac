//
//  ListCardView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import SwiftUI

struct ListCardView: View {
    
 
    @StateObject var viewModel = ListCardViewModel()
    
    // poprawic klase na main actora w klasie !!!
    // nie moge dac tego do class nw czemu
   
    var type: String
    
    
    
    var fillteredCard: [Cards]{
        
        if viewModel.searchText.isEmpty {
            return viewModel.cards.filter { $0.cardType.contains(type) }
            
        }else {
            return viewModel.cards.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) &&  $0.cardType.contains(type) }
        }
    }
    
    
    
    
    
    
    var body: some View {
        
        ScrollView{
            TextField("Search", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .cornerRadius(8)
            LazyVGrid(columns: viewModel.colums){
                if viewModel.isLoading {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.headline)
                    ProgressView()
                }else{
                
                    ForEach(fillteredCard, id: \.self){ card in
                        
                        
                        if let image = viewModel.images[card.link]{
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    viewModel.selectedImage = ImageWrapper(image: image)
                                    
                                }
                                .sheet(item: $viewModel.selectedImage) { imageWrapper in
                                    Image(uiImage: imageWrapper.image)
                                        .resizable()
                                        .scaledToFit()
                                }
                            
                            
                        } else {
                            Text("ERROR")
                        }
                    }
                }
                
            }
            
        }
            .onAppear {
                for card in fillteredCard {
                    
                    
                    URLSession.shared.dataTask(with: card.link){ data , response , error in
                        guard error == nil, let data = data else {return}
                        
                        
                        let image = UIImage(data: data)
                        viewModel.images[card.link] = image
                        if viewModel.images.count == fillteredCard.count {
                            viewModel.isLoading = false
                        }
                    } .resume()
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
