//
//  ListCardView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import SwiftUI
import Combine

struct ListCardView: View {
    @EnvironmentObject var viewModel: ListCardViewModel
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
   
    var body: some View {
        ScrollView {
            TextField("Search", text: $viewModel.searchText)
                .onChange(of: viewModel.searchText) { newValue in
                    viewModel.reloadData()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .cornerRadius(8)
            LazyVGrid(columns: colums) {
                if viewModel.isLoading {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.headline)
                    ProgressView()
                } else {
                    ForEach(viewModel.cards, id: \.self) { card in
                        if let image = card.image {
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
            viewModel.fetchCards()
        }
        .navigationTitle(viewModel.type.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView()
            .environmentObject(ListCardView.ListCardViewModel(type: .monster))
    }
}
