//
//  PlayerTurnView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 30/08/22.
//

import SwiftUI

struct PlayerTurnView: View {
    @StateObject var playerTurnViewModel: PlayerTurnCardViewModel
    @Binding var card: Bool
    @State var update: Bool = true
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.gray)
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<playerTurnViewModel.gameVM.players.count, id: \.self) {i in
                        if update == true || update == false {
                            PlayerTurnCardView(player: $playerTurnViewModel.gameVM.players[i], card: $card, turns: i + 1, divider: i == playerTurnViewModel.gameVM.players.count - 1 ? false : true)
                        }
//                        Divider()
                    }
//                    Button {
//                        playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
//                    } label: {
//                        Text("Test")
//                    }

                }//HStack
                .padding()
                .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
            }//ScrollView
            
        }//ZStack
        .frame(height: 126 / 844 * UIScreen.main.bounds.height)
        .padding()
        .onAppear {
            playerTurnViewModel.randomizeTurn()
        }
        .onChange(of: card) { newValue in
            if card == true {
                playerTurnViewModel.randomizeTurn()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    update.toggle()
                }
            }
        }
//        Text("Test")
//            .onTapGesture {
//                playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
//            }
    }
}
