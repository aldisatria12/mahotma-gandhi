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
    @Published var baseColor = Color.red
    @Published var cardImageName = ""
    @Published var cardHelpName = ""
    // counter for animation
    @Published var counterFirst = 0
    @Published var counterSecond = 1
    @Published var counterThird = 2
    
    @Published var floorImageIndex : [Int:String] = [:]
    
    @Published var isTopMenuShowed = false
    @Published var isCardOpen = false
    @Published var isMoving = true
    
    var game: GameModel
    
    // turn view model
    var playerTurn: PlayerTurnCardViewModel
    
    init(players: [PlayerModel]) {
        game = GameModel(players: players)
        playerTurn = PlayerTurnCardViewModel(game: game)
        for i in 0...2 {
            floorImageIndex[i] = randomFloorImage()
        }
    }
    
    
    
    func goToNextFloor() {
        game.toNextFloor()
        gameTitle = game.floorInfo.gameType
        gameQuestion = game.floorInfo.question
        gameFloor = game.floorCounter
        baseColor = game.floorInfo.cardBaseColor
        cardImageName = game.floorInfo.cardImage
        cardHelpName = game.floorInfo.helpImage
        isTopMenuShowed = true
        isMoving = false
    }
    
    func animateMovement() {
        counterFirst = addCounter(counter: counterFirst)
        counterSecond = addCounter(counter: counterSecond)
        counterThird = addCounter(counter: counterThird)
        changeFloorImageIndex()
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
    
    func changeFloorImageIndex() {
        floorImageIndex[(game.floorCounter * 2) % 3] = randomFloorImage()
        print("Floor : \((game.floorCounter * 2) % 3), \(floorImageIndex[(game.floorCounter * 2) % 3])")
    }
    
    func randomFloorImage() -> String {
        return game.floorImages.randomElement() ?? ""
    }
}
