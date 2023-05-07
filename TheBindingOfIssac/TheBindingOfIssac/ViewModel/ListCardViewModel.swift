//
//  ListCardViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import Foundation
import SwiftUI

extension ListCardView{
  @MainActor  class ListCardViewModel:ObservableObject {
        
        var cards: [Cards]
      
      @Published var searchText = ""

      @Published  var  isLoading = true
        let colums = [
            GridItem(.adaptive(minimum: 150))
            
        ]
        
      
      @Published  var selectedImage: ImageWrapper? = nil

      @Published var images = [URL: UIImage]()

        
        init() {
            cards =  Bundle.main.decode("JSON_data.json")
            
        }
        
        
    }
}
