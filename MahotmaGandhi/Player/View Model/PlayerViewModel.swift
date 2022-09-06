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
    @Published var avatarName = ["Wayfarer", "Guardian", "M1", "M2", "M3", "M4", "F1", "F2"]
    
    func playerSelect(selectPlayer: Int){
        selectedPlayer = selectPlayer
    }
    
    func addPlayer(){
        var randomAva = "Wayfarer"
        selectedPlayer = allPlayer.count
        while allPlayer.contains(where: {$0.avatar == randomAva}) {
            randomAva = avatarName[Int.random(in: 0...avatarName.count - 1)]
        }
        allPlayer.append(PlayerModel(name: "", avatar: randomAva))
    }
    
    func playerRemove(removeAt: Int){
        if removeAt <= selectedPlayer {
            selectedPlayer -= 1
        }
        allPlayer.remove(at: removeAt)
    }
}

