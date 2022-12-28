//
//  ListCardViewModel.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import Foundation
import SwiftUI

class ListCardViewModel{
    
    var cards: [Cards] = Bundle.main.decode("JSON_data.json")

    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    
    ]

    



    init() {
       
    }

    
    
}
