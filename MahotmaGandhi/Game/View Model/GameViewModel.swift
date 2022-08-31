//
//  GameViewModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import Foundation
import SwiftUI

class GameViewModel : ObservableObject {
    // game information
    @Published var gameTitle = ""
    @Published var gameQuestion = ""
    @Published var gameFloor = 0
    // counter for animation
    @Published var counterFirst = 0
    @Published var counterSecond = 1
    @Published var counterThird = 2
    var game: GameModel
    
    init(players: [PlayerModel]) {
        game = GameModel(players: players)
    }
    @Published var isTopMenuShowed = false
    @Published var isMoving = true
    
    // var game = GameModel()
    
    func goToNextFloor() {
        game.toNextFloor()
        gameTitle = game.floorInfo.gameType
        gameQuestion = game.floorInfo.question
        gameFloor = game.floorCounter
        isTopMenuShowed = true
        isMoving = false
    }
    
    func animateMovement() {
        counterFirst = addCounter(counter: counterFirst)
        counterSecond = addCounter(counter: counterSecond)
        counterThird = addCounter(counter: counterThird)
        isTopMenuShowed = false
        isMoving = true
    }
    
    func addCounter(counter : Int) -> Int {
        if counter == 2 {
            return 0
        } else {
            return counter + 1
        }
    }
}
