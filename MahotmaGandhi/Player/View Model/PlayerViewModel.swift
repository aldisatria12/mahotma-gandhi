//
//  PlayerViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var allPlayer = [PlayerModel(name: "", avatar: "Wayfarer")]
    @Published var selectedPlayer: Int = 0
    var avatarName = ["Wayfarer", "Guardian", "Nekomancer", "Wayfarer02", "Guardian02", "Nekomancer02"]
    
    func playerSelect(selectPlayer: Int){
        selectedPlayer = selectPlayer
    }
    
    func addPlayer( editedPlayer: inout [PlayerModel]){
        var randomAva = "Wayfarer"
//        selectedPlayer = editedPlayer.count
        while editedPlayer.contains(where: {$0.avatar == randomAva}) {
            randomAva = avatarName[Int.random(in: 0...avatarName.count - 1)]
        }
        editedPlayer.append(PlayerModel(name: "", avatar: randomAva))
    }
    
    func playerRemove(removeAt: Int){
        if removeAt <= selectedPlayer {
            selectedPlayer -= 1
        }
        allPlayer.remove(at: removeAt)
    }
}

