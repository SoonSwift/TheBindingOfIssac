//
//  ContentView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    let menuCards = MenuCards()
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                
                Image("FourSoulsLogo")
                    .resizable()
                    .scaledToFit()
                ForEach(menuCards.cards, id: \.self){ card in
                    HStack{
                        Image("\(card)")
                            .resizable()
                            .frame(width: 70, height: 96)
                            .padding(.horizontal, 16)
                        
                        
                        NavigationLink{
                            Text("there will be something")
                        } label: {
                            Text(card)
                                .font(.system(size: 36, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                    }
                }
            }
        
                // MENU enter button
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem{
                        Button("Menu"){
                            
                        }
                        .foregroundColor(.red)
                        
                    }
                  
                }
                
                .toolbarBackground(Color(red: 0.1, green: 0.1, blue: 0.2), for: .navigationBar)
            
       
            .background(Color(red: 0.1, green: 0.1, blue: 0.2))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
