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
    @Published var isTextAnimated = false
    @Published var isTutorialItemShowed = false
    @Published var isCardFlipped = false
//    @Published var isDotsUp = false
    
//    @Published var letterShowing : Double = 0
    
    @Published var tutorialState = (0, -1)
    
    
    let gameQuestion = "What is your favorite childhood memory?"
    
    var dummyPlayers : [PlayerModel] = [
        PlayerModel(name: "Someone", avatar: "Wayfarer"),
        PlayerModel(name: "Noone", avatar: "Guardian")
    ]
    
    private let tutorialPointer : [Int:[String]] = [
        0 : [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"
            ] ,
        1 : [
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"
        ],
        2 : [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        ],
        3 : [
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"
        ]
    ]
    
    private var selectedPointer = ""
    private var numberOfLetterShowed = 0
    
    func animateTutorialMovement() {
        tutorialCounter[0] = 1
        tutorialCounter[1] = 2
    }
    
    func changeTutorialState() {
        tutorialState.1 += 1
        if tutorialState.1 == tutorialPointer[tutorialState.0]?.count{
            tutorialState.0 += 1
            tutorialState.1 = -1
//            isTutorialPresented = false
        }
    }
    
    func animateTextAppearance() {
        if numberOfLetterShowed <= selectedPointer.count {
            tutorialPointerText = "\(selectedPointer.prefix(numberOfLetterShowed))"
            numberOfLetterShowed += 1
        } else {
//            isDotsUp = true
            isTextAnimated = false
        }
    }
    
    func getTutorialPointer() {
        if isTextAnimated {
            isTextAnimated = false
//            isDotsUp = true
            tutorialPointerText = selectedPointer
        } else if tutorialPointerText == "No Text Found" {
            isTextAnimated = false
            isTutorialPresented = false
        } else if tutorialState.1 != tutorialPointer[tutorialState.0]!.count - 1 {
            changeTutorialState()
            print(tutorialState.0, " : ", tutorialState.1)
            if tutorialState.1 != -1 {
                if let tempSelectedPointer = tutorialPointer[tutorialState.0]?[tutorialState.1] {
                    selectedPointer = tempSelectedPointer
                    numberOfLetterShowed = 0
                    isTextAnimated = true
                    if tutorialState.1 == tutorialPointer[tutorialState.0]!.count - 1 || (tutorialState.0 == 0 && tutorialState.1 == 1) {
//                        print(tutorialPointer[tutorialState.0]?.count)
                        isTutorialItemShowed = true
                    } else {
                        isTutorialItemShowed = false
                    }
                } else {
                    isTextAnimated = false
                    tutorialPointerText = "No Text Found"
                }
            }
        }
    }
//    if tutorialState.1 != tutorialPointer[tutorialState.0]?.count
}
