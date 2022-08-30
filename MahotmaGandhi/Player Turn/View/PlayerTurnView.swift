//
//  PlayerTurnView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 30/08/22.
//

import SwiftUI

struct PlayerTurnView: View {
    @StateObject var playerTurnViewModel: PlayerTurnCardViewModel
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.gray)
//            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<playerTurnViewModel.randomTurnPlayer.count, id: \.self) {i in
                        PlayerTurnCardView(name: playerTurnViewModel.randomTurnPlayer[i].name, avatar: playerTurnViewModel.randomTurnPlayer[i].avatar, turns: i + 1, divider: i == playerTurnViewModel.randomTurnPlayer.count - 1 ? false : true)
//                        Divider()
                    }
                }//HStack
//            }//ScrollView
            .padding()
            .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
        }//ZStack
        .frame(height: 200)
        .padding()
        .onAppear {
            playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
        }
        Text("Test")
            .onTapGesture {
                playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
            }
    }
}
