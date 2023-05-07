//
//  Cards.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 15/12/2022.
//

import Foundation

struct Cards: Codable, Hashable {
    let name: String
    let cardType: CardType
    let link: URL
}

import SwiftUI

struct CardViewModel: Hashable {
    let name: String
    let image: UIImage?
}
