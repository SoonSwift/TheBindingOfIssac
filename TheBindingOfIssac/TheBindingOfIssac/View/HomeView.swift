//
//  ContentView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 23/11/2022.
//

import SwiftUI

struct HomeView: View {
    
   @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                        .padding(.vertical)
                    
                    Image(viewModel.menuImage)
                        .resizable()
                        .scaledToFit()
                    ScrollView{
                        ForEach(viewModel.cardCategories, id: \.imageName) { cardCategory in
                            CardCategoryView(categoryCard: cardCategory)
                        }
                    }
                }
                
                let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width > 100 {
                            withAnimation {
                                viewModel.showMenu = false
                            }
                        }
                    }
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        SideMenuView(viewModel: viewModel)
                            .offset(x: viewModel.showMenu ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.4),
                                       value: viewModel.showMenu)
                    }
                    .gesture(drag)
                }
                .background(.black.opacity(viewModel.showMenu ? 0.5 : 0))
            }
            
            // MENU enter button
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem{
                    Button("Menu") {
                        viewModel.showMenu.toggle()
                    }
                    .foregroundColor(.red)
                }
            }
            .toolbarBackground(.darkBackground, for: .navigationBar)
            .preferredColorScheme(.dark)
            .background(.darkBackground)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
