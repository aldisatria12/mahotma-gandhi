//
//  PlayerTurnCardViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 26/08/22.
//

import SwiftUI

class PlayerTurnCardViewModel: ObservableObject {
    @Published var randomTurnPlayer: [PlayerModel] = []
    var gameVM: GameModel
    
    init(game: GameModel) {
        gameVM = game
    }
    
    func randomizeTurn() {
        var playerList: [PlayerModel] = []
        var turnList: [PlayerModel] = []
        var pickedPlayer: PlayerModel = PlayerModel(name: "", avatar: "")
        var sumChances = 0
        var randomPick = 0
        for i in 0..<gameVM.players.count {
            sumChances += gameVM.players[i].chances
            playerList.append(gameVM.players[i])
            playerList[i].chances = sumChances
        }
        while turnList.count < gameVM.players.count {
            randomPick = Int.random(in: 1...sumChances)
            for i in 0..<gameVM.players.count {
                if randomPick <= playerList[i].chances {
                    pickedPlayer = playerList[i]
                    if turnList.contains(where: {$0.avatar == pickedPlayer.avatar}){
                        break
                    }
                    turnList.append(pickedPlayer)
                    gameVM.players[i].chances += turnList.count
                    break
                }
            }
        }
        gameVM.players = turnList
    }
    
}
