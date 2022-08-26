//
//  GameViewModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import Foundation
import SwiftUI

class GameViewModel : ObservableObject {
    @Published var gameTitle = ""
    @Published var gameQuestion = ""
    @Published var gameFloor = ""
    
    var game = GameModel()
    
    func goToNextFloor() {
        game.toNextFloor()
        gameTitle = game.floorInfo.gameType
        gameQuestion = game.floorInfo.question
        gameFloor = "\(game.floorCounter)"
    }
}
