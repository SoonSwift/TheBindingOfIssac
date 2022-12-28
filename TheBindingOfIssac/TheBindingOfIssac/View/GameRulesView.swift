//
//  GameRulesView.swift
//  TheBindingOfIssac
//
//  Created by Marcin Dytko on 28/12/2022.
//

import SwiftUI

struct GameRulesView: View {
    


    
    var body: some View {
            ScrollView {
                LazyVStack(alignment: .leading){
                    Group{
                        HStack{
                            Text("The Basics")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Text("2-4 Players take turns playing Loot cards and using Items to kill Monsters in order to gain more Items, Loot cards and sometimes Souls. The first player to gain 4 souls is the winner. Co-operation, bartering and betrayal are all strongly encouraged.")
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                            .padding(.vertical)
                        
                        HStack{
                            Text("Starting the Game")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer()
                        Text("The Monster, Loot and Treasure decks are each shuffled and placed apart on the table. 2 Monster cards are revealed and placed face up next to the Monster deck. These are the current active Monsters. If any non-Monster cards are revealed this way, place them at the bottom of the deck and continue this process until 2 Monster cards are revealed.2 Treasure Items are revealed and placed face up next to the Treasure deck. These are the current Store Items. Shuffle the Character deck and deal out one Character card to all players face down. Each player then reveals their Character and gains their Starting Item. All players start with their Character card deactivated (turned sideways).Each player starts the game with 3 loot cards and 3¢. Cain always plays first. If Cain is not one of the characters drawn, then the saddest person playing goes first, or just roll a dice, whatever works…")
                            .foregroundColor(.white)
                        
                        
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                            .padding(.vertical)
                    }
                    
                    
                    Group{
                        HStack{
                            Text("Player turn")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Text("1. Recharge all active Items and your Player card - Turn all Items and Player cards upright.")
                            .foregroundColor(.white)
                        Text("2. Loot 1 - Draw the top card from the Loot deck and put it in your hand.")
                            .foregroundColor(.white)
                        
                        Text("3. Action Phase: During their Action Phase, the active player may do any or all of the following in any order: Play 1 Loot card - This can be in response to any action. Purchase 1 Store Item or topmost card of the Treasure deck - All Store Items cost 10¢, including the topmost card of the deck. Attack a Monster - The player can choose to attack any active Monster or attack the topmost card of the Monster deck. Activate their Player card to play an additional Loot card - Player cards can also be saved and activated on other players’ turns in response to any action. ")
                            .foregroundColor(.white)
                        
                        Text("4. Ending Phase Heal all Players and Monsters. Discard down to 10 Loot cards if you  have more than 10 in your hand. Pass the turn to the player to your left.")
                            .foregroundColor(.white)
                        
                        
                    }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                        .padding(.vertical)
                    
                    Group {
                        HStack{
                            Image("Loot Card")
                                .resizable()
                                .frame(width: 70, height: 96)
                                .padding(.horizontal, 16)
                                
                            Text("Loot cards are the only cards you draw and keep in your hand. Playing them can instantly change the flow of the game in many interesting ways.")
                                .foregroundColor(.white)
                        }
                        HStack{
                            Image("Monster Card")
                                .resizable()
                                .frame(width: 70, height: 96)
                                .padding(.horizontal, 16)
                                
                            Text("The Monster deck is the meat and potatoes of the game. It’s filled with basic Monsters, Bosses, Treasures, Curses and other surprises.")
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Image("Treasure Card")
                                .resizable()
                                .frame(width: 70, height: 96)
                                .padding(.horizontal, 16)
                                
                            Text("Treasure cards are Items that players gain. Treasure cards are put directly into play in front of the player, are visible to everyone and tend to have very strong effects that modify gameplay and interact with other players and Monsters.")
                                .foregroundColor(.white)
                        }
                        
                        
                        HStack{
                            Image("Bonus Soul")
                                .resizable()
                                .frame(width: 70, height: 96)
                                .padding(.horizontal, 16)
                                
                            Text("Once players have a better understanding of the game’s mechanics, you are encouraged to add the Bonus Souls (the Soul of Guppy, the Soul of Greed and the Soul of Gluttony) to your games. These bonus cards aren’t added to any deck but Instead lay face up on the table next to the game decks in view of all the players.")
                                .foregroundColor(.white)
                        }

                    }
                    
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rules")
                        .foregroundColor(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
            .background(.darkBackground)
            
        
        
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
