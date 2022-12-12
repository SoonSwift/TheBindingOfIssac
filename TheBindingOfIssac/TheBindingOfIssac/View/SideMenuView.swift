//
//  SideMenuView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 06/12/2022.
//

import SwiftUI

struct SideMenuView: View {
    // ToDo: Change this viewModel
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
            VStack{
                HStack{
                    Text("Game assistant")
                        .foregroundColor(.white)
                        .font(.headline)
                    Image("Bum-bo_the_Brave")
                        .resizable()
                        .frame(width: 30, height: 40)
                    
                }
                .padding(.top, 20)
                
                HStack{
                    Text("Game rules")
                        .foregroundColor(.white)
                        .font(.headline)
                    Image("Issac")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding(.top, 20)
                
                
                HStack{
                    Button("Back"){
                        viewModel.showMenu.toggle()
                    }
                    .foregroundColor(.red)
                    .font(.headline)
                }
                .padding(.top, 20)
                
                
                
                
                Spacer()
            }
            .padding(16)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(viewModel: HomeViewModel())
    }
}
