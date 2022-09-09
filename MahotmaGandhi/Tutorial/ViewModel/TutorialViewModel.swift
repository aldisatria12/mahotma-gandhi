//
//  TutorialViewModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 07/09/22.
//

import Foundation
import SwiftUI

class TutorialViewModel : ObservableObject {
    @Published var tutorialCounter = [0 : 0 , 1 : 1]
    
    @Published var isTopMenuShowed = true
    @Published var isCardOpen = false
    @Published var isMoving = false
    @Published var isTutorialPresented = true
    
    
    let gameQuestion = "What is your favorite childhood memory?"
    
    var dummyPlayers : [PlayerModel] = [
        PlayerModel(name: "Someone", avatar: "Wayfarer"),
        PlayerModel(name: "Noone", avatar: "Guardian")
    ]
    
    func animateTutorialMovement() {
        tutorialCounter[0] = 1
        tutorialCounter[1] = 2
    }
}
