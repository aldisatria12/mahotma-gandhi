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
        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.gray)
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<randomTurnPlayer.count, id: \.self) {i in
                        PlayerTurnCardView(name: randomTurnPlayer[i].name, avatar: randomTurnPlayer[i].avatar, turns: i + 1, divider: i == randomTurnPlayer.count - 1 ? false : true)
                        Text("\(allPlayer[i].chances)")
//                        Divider()
                    }
                }//HStack
            }//ScrollView
            .padding()
            .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
        }//ZStack
        .frame(height: 200)
        .padding()
        .onAppear {
            randomTurnPlayer = randomizeTurn()
        }
        Text("Test")
            .onTapGesture {
                randomTurnPlayer = randomizeTurn()
            }
    }
    
    
    
    func randomizeTurn() -> [PlayerModel] {
        var playerList: [PlayerModel] = []
        var turnList: [PlayerModel] = []
        var pickedPlayer: PlayerModel = PlayerModel(name: "", avatar: "")
        var sumChances = 0
        var randomPick = 0
        for i in 0..<allPlayer.count {
            sumChances += allPlayer[i].chances
            playerList.append(allPlayer[i])
            playerList[i].chances = sumChances
        }
        while turnList.count < allPlayer.count {
            randomPick = Int.random(in: 1...sumChances)
            for i in 0..<allPlayer.count {
                if randomPick <= playerList[i].chances {
                    pickedPlayer = playerList[i]
                    if turnList.contains(where: {$0.avatar == pickedPlayer.avatar}){
                        break
                    }
                    turnList.append(pickedPlayer)
                    allPlayer[i].chances += turnList.count
                    break
                }
            }
        }
        return turnList
    }
}

struct PlayerTurnCardViewModel_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTurnCardViewModel(allPlayer: .constant([PlayerModel(name: "A", avatar: "M1")]))
    }
}
