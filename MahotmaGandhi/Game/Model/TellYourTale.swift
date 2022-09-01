//
//  TellYourTaleModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class TellYourTale {
    let title = "Tell a Tale"
    let helpImage = "Card_TellATale_Guide"
    let cardImage = "Card_TellATale_Front"
    let baseColor = red01
    private var questions : [String] = [
        "Would you like to be famous? In what way?",
        "Before making a telephone call, do you ever rehearse what you are going to say? Why?",
        "For what in your life do you feel most grateful?",
        "What do you value most in a friendship?",
        "Tell us about your first love",
        "What is your favorite childhood memory?",
        "When did you last sing to yourself? To someone else?",
        "If you could change anything about the way you were raised, what would it be?",
        "If you could wake up tomorrow having gained any one quality or ability, what would it be?",
        "Is there something that you’ve dreamed of doing for a long time? Why haven’t you done it?"
    ]
    private var availableQuestions : [String] = [
        "Would you like to be famous? In what way?",
        "Before making a telephone call, do you ever rehearse what you are going to say? Why?",
        "For what in your life do you feel most grateful?",
        "What do you value most in a friendship?",
        "Tell us about your first love",
        "What is your favorite childhood memory?",
        "When did you last sing to yourself? To someone else?",
        "If you could change anything about the way you were raised, what would it be?",
        "If you could wake up tomorrow having gained any one quality or ability, what would it be?",
        "Is there something that you’ve dreamed of doing for a long time? Why haven’t you done it?"
    ]
    
    func getQuestion() -> Floor {
        if availableQuestions.isEmpty {
            availableQuestions = questions
        }
        
        let randomIndex = Int.random(in: 0..<availableQuestions.count)
        let pickedQuestion = availableQuestions[randomIndex]
        availableQuestions.remove(at: randomIndex)
        
        return Floor(gameType: self.title, question: pickedQuestion, helpImage: self.helpImage, cardImage: self.cardImage, cardBaseColor: self.baseColor)
    }
    
}
