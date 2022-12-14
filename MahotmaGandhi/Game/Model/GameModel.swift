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
    private var floorQueue : [FloorType] = []
    var floorInfo : Floor
    private var neverHaveIEverGame : NeverHaveIEver
    private var tellYourTaleGame : TellYourTale
    private var wouldYouRather : WouldYouRather
    private var gameTypeSequence : [[FloorType]] = [
        [.tellYourTale, .tellYourTale, .neverHaveIEver, .wouldYouRather, .neverHaveIEver, .wouldYouRather],
        [.tellYourTale, .neverHaveIEver, .wouldYouRather, .tellYourTale, .wouldYouRather, .neverHaveIEver],
        [.neverHaveIEver, .tellYourTale, .tellYourTale, .neverHaveIEver, .wouldYouRather, .wouldYouRather],
        [.neverHaveIEver, .neverHaveIEver, .wouldYouRather, .tellYourTale, .tellYourTale, .wouldYouRather]
    ]
    var floorImages : [String] = ["stage_1", "stage_2"]
    
    
    init(players: [PlayerModel]) {
        id = UUID().uuidString
        self.players = players
        floorCounter = 0
        floorInfo = Floor(gameType: "", question: "", helpImage: "", cardImage: "",  cardBaseColor: red01)
        neverHaveIEverGame = NeverHaveIEver()
        tellYourTaleGame = TellYourTale()
        wouldYouRather = WouldYouRather()
    }
    
    func toNextFloor() {
        self.floorCounter += 1
        if floorQueue.count < 1 {
            addFloorQueue()
        }
        getFloorInfo()
        removeFromQueue()
    }
    
    func getFloorInfo() {
        let gameType = floorQueue[0]
        switch gameType {
        case .neverHaveIEver:
            self.floorInfo = neverHaveIEverGame.getQuestion()
        case .tellYourTale:
            self.floorInfo = tellYourTaleGame.getQuestion()
        case .wouldYouRather:
            self.floorInfo = wouldYouRather.getQuestion()
        }
    }
    
    // random biasa
    func addFloorQueue() {
        floorQueue += gameTypeSequence.randomElement()!
    }
    
    func removeFromQueue() {
        floorQueue.remove(at: 0)
    }
    
    
}
