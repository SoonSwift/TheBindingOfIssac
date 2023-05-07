//
//  CardCategoryView.swift
//  TheBindingOfIssac
//
//  Created by Tomasz Przybysz on 07/05/2023.
//

import SwiftUI

struct CardCategoryView: View {
    let categoryCard: CategoryCard
    
    var body: some View {
        HStack {
            Image("\(categoryCard.imageName)")
                .resizable()
                .frame(width: 70, height: 96)
                .padding(.horizontal, 16)
            
            NavigationLink() {
                switch categoryCard.text {
                case "Character Card":
                    ListCardView()
                        .environmentObject(ListCardView.ListCardViewModel(type: .character))
                case "Loot Card":
                    ListCardView()
                        .environmentObject(ListCardView.ListCardViewModel(type: .loot))
                case "Monster Card":
                    ListCardView()
                        .environmentObject(ListCardView.ListCardViewModel(type: .monster))
                case "Treasure Card":
                    ListCardView()
                        .environmentObject(ListCardView.ListCardViewModel(type: .treasure))
                case "Bonus Soul":
                    ListCardView()
                        .environmentObject(ListCardView.ListCardViewModel(type: .bonus))
                default:
                    HomeView()
                }
            } label: {
                Text(categoryCard.text)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct CardCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CardCategoryView(categoryCard: CategoryCard(imageName: "Character Card",
                                                    text: "Character Card",
                                                    type: .character))
        .background(.black)
    }
}
