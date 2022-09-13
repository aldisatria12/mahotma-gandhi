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
            "What's up, Adventurers! Welcome to The Spire.",
            "You can call me as The Sage.  Now allow me to show you around.",
            "The Spire holds a lot of fascinating treasures.",
            "Upon unravelling each one, it is better to SHARE them with your fellow Adventurers.",
            "Oh look! You found a chest. Let’s tap to see what’s inside."
            ] ,
        1 : [
            "Well, would you look at that — it’s a card!",
            "Everyone will have to take turns in answering each statement on the card.",
            "If you still don’t know how to answer a card, tap the question mark for instructions on how to play them!"
        ],
        2 : [
            "Now that everyone has understood the instructions, tap the back button to return."
        ],
        3 : [
            "And once everyone had finished their turns, to continue your journey, click on the “Next Floor” button!"
        ],
        4 : [
            "So what do you say, fellow Adventurers?  Ready to hunt for more treasure?"
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
                    if tutorialState.1 == tutorialPointer[tutorialState.0]!.count - 1 || (tutorialState.0 == 1 && tutorialState.1 == 1) {
                        isTutorialItemShowed = true
                    } else {
                        isTutorialItemShowed = false
                    }
                } else {
                    isTextAnimated = false
                    tutorialPointerText = "No Text Found"
                }
            }
        } else if tutorialState.1 == tutorialPointer[tutorialState.0]!.count - 1 && tutorialState.0 == 4 {
            NavigationUtil.popToRootView()
        }
    }
}
