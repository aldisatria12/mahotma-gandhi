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
    
    // ["M1","M2","M3","M4","F1","F2","F3","F4"]
    
    let gameQuestion = "What is your favorite childhood memory?"
    
    var dummyPlayers : [PlayerModel] = [
        PlayerModel(name: "Someone", avatar: "M1"),
        PlayerModel(name: "Noone", avatar: "F1")
    ]
    
    func animateTutorialMovement() {
        tutorialCounter[0] = 1
        tutorialCounter[1] = 2
    }
}
