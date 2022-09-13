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
    @Published var mainCounter = [0 : 0, 1 : 1, 2 : 2]
    
    @Published var floorImageIndex : [Int:String] = [:]
    
    @Published var isTopMenuShowed = false
    @Published var isCardOpen = false
    @Published var isMoving = true
    @Published var showingPauseMenu = false
//    @AppStorage("isTutorial") var isTutorial = true
    
    @Published var showingPlayerMenu = false
    
    @Published var allPlayers: [PlayerModel] = []
    var game: GameModel
    
    // turn view model
    var playerTurn: PlayerTurnCardViewModel
    
    init(players: [PlayerModel]) {
        game = GameModel(players: players)
        playerTurn = PlayerTurnCardViewModel(game: game)
        for i in 0...2 {
//            if i == 1 {
//                floorImageIndex[i] = "stage"
//            } else {
//                floorImageIndex[i] = randomFloorImage()
//            }
            floorImageIndex[i] = randomFloorImage()
        }
        allPlayers = game.players
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
        for i in 0...2 {
            mainCounter[i] = addCounter(counter: mainCounter[i]!)
        }
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
    }
    
    func randomFloorImage() -> String {
        return game.floorImages.randomElement() ?? ""
    }
    
}
