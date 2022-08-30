//
//  PlayerTurnCardViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 26/08/22.
//

import SwiftUI

class PlayerTurnCardViewModel: ObservableObject {
    @Published var randomTurnPlayer: [PlayerModel] = []
    var playerViewModel: PlayerViewModel
    
    init(playerVM: PlayerViewModel) {
        playerViewModel = playerVM
    }
    
    func randomizeTurn() -> [PlayerModel] {
        var playerList: [PlayerModel] = []
        var turnList: [PlayerModel] = []
        var pickedPlayer: PlayerModel = PlayerModel(name: "", avatar: "")
        var sumChances = 0
        var randomPick = 0
        for i in 0..<playerViewModel.allPlayer.count {
            sumChances += playerViewModel.allPlayer[i].chances
            playerList.append(playerViewModel.allPlayer[i])
            playerList[i].chances = sumChances
        }
        while turnList.count < playerViewModel.allPlayer.count {
            randomPick = Int.random(in: 1...sumChances)
            for i in 0..<playerViewModel.allPlayer.count {
                if randomPick <= playerList[i].chances {
                    pickedPlayer = playerList[i]
                    if turnList.contains(where: {$0.avatar == pickedPlayer.avatar}){
                        break
                    }
                    turnList.append(pickedPlayer)
                    playerViewModel.allPlayer[i].chances += turnList.count
                    break
                }
            }
        }
        return turnList
    }
    
}
