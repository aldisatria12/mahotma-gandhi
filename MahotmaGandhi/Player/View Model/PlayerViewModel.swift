//
//  PlayerViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var allPlayer = [PlayerModel(name: "", avatar: "M1")]
    @Published var selectedPlayer: Int = 0
    var avatarName = ["M1","M2","M3","M4","F1","F2","F3","F4"]
    
    func playerSelect(selectPlayer: Int){
        selectedPlayer = selectPlayer
    }
    
    func addPlayer(){
        var randomAva = "M1"
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

