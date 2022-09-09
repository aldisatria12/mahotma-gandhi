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
    @Published var tutorialPointerText = ""
    
    @Published var isTopMenuShowed = true
    @Published var isCardOpen = false
    @Published var isMoving = false
    @Published var isTutorialPresented = false
    
    var tutorialState = (0, -1)
    
    
    let gameQuestion = "What is your favorite childhood memory?"
    
    var dummyPlayers : [PlayerModel] = [
        PlayerModel(name: "Someone", avatar: "Wayfarer"),
        PlayerModel(name: "Noone", avatar: "Guardian")
    ]
    
    var tutorialPointer : [Int:[String]] = [
        0 : [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"
            ] ,
        1 : [
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"
        ]
    ]
    
    func animateTutorialMovement() {
        tutorialCounter[0] = 1
        tutorialCounter[1] = 2
    }
    
    func changeTutorialState() {
        tutorialState.1 += 1
        if tutorialState.1 == tutorialPointer[tutorialState.0]?.count{
            tutorialState.0 += 1
            tutorialState.1 = -1
            isTutorialPresented = false
        }
    }
    
    func getTutorialPointer() {
        changeTutorialState()
        print(tutorialState.0, " : ", tutorialState.1)
        if tutorialState.1 != -1 {
            tutorialPointerText = tutorialPointer[tutorialState.0]?[tutorialState.1] ?? "No Text Found"
        }
    }
}
