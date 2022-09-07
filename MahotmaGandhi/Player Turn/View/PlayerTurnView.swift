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
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.gray)
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<playerTurnViewModel.randomTurnPlayer.count, id: \.self) {i in
                        PlayerTurnCardView(player: $playerTurnViewModel.randomTurnPlayer[i], card: $card, turns: i + 1, divider: i == playerTurnViewModel.randomTurnPlayer.count - 1 ? false : true)
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
        .frame(height: 126)
        .padding()
        .onAppear {
            playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
        }
        .onChange(of: card) { newValue in
            if card == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
                }
            }
        }
//        Text("Test")
//            .onTapGesture {
//                playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
//            }
    }
}
