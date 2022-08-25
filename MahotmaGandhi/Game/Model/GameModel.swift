//
//  GameModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class GameModel {
    var id : String
    var players : [PlayerModel]
    var floorCounter : Int
    
    init(players : [PlayerModel]) {
        id = UUID().uuidString
        self.players = players
        floorCounter = 1
    }
    
    func nextFloor() {
        self.floorCounter += 1
    }
}
