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
        NavigationView{
            ZStack{
                VStack{
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                        .padding(.vertical)
                    
                    Image(viewModel.getMenuImage())
                        .resizable()
                        .scaledToFit()
                    ScrollView{
                        ForEach(viewModel.getCards(), id: \.imageName){ card in
                            HStack{
                                Image("\(card.imageName)")
                                    .resizable()
                                    .frame(width: 70, height: 96)
                                    .padding(.horizontal, 16)
                                
                                
                                
                                NavigationLink(){
                                    switch card.text {
                                    case "Character Card":
                                        ListCardView()
                                    default:
                                        HomeView()
                                        
                                    }
                                } label: {
                                    Text(card.text)
                                        .font(.system(size: 36, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                }
                                
                            }
                        }
                    }
                }
               
                let drag = DragGesture()
                    .onEnded{
                        if $0.translation.width > 100 {
                            withAnimation {
                                viewModel.showMenu = false
                            }
                        }
                    }
                
                GeometryReader{ _ in
                    HStack{
                        Spacer()
                        SideMenuView(viewModel: viewModel)
                        
                            .offset(x: viewModel.showMenu ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.4), value: viewModel.showMenu)

                        
                    }
                    
                    .gesture(drag)
                    
                }
              
                
                .background(.black.opacity(viewModel.showMenu ? 0.5 : 0))
            }
            
        
                // MENU enter button
                .navigationBarTitleDisplayMode(.inline)
            
                .toolbar{
                    ToolbarItem{
                        Button("Menu"){
                            viewModel.showMenu.toggle()
                        }
                        .foregroundColor(.red)
                        
                    }
                    
                }
                
                .toolbarBackground(Color(red: 0.1, green: 0.1, blue: 0.2), for: .navigationBar)
                
       
            .background(Color(red: 0.1, green: 0.1, blue: 0.2))
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
