//
//  PlayerTurnCardViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 26/08/22.
//

import SwiftUI

struct PlayerTurnCardViewModel: View {
    @Binding var allPlayer: [PlayerModel]
    @State var randomTurnPlayer: [PlayerModel] = []
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<randomTurnPlayer.count, id: \.self) {i in
                    PlayerTurnCardView(name: randomTurnPlayer[i].name, avatar: randomTurnPlayer[i].avatar, turns: i + 1)
                }
            }
            .padding(5)
        }
        .onAppear {
            randomTurnPlayer = allPlayer
            randomTurnPlayer.shuffle()
        }
    }
}

struct PlayerTurnCardViewModel_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTurnCardViewModel(allPlayer: .constant([PlayerModel(name: "", avatar: "M1")]))
    }
}
