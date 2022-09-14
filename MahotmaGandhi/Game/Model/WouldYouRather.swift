//
//  WouldYouRather.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 14/09/22.
//

import Foundation

class WouldYouRather {
    let title = "Would You Rather"
    let helpImage = "Card_WouldYou_Guide"
    let cardImage = "Card_WouldYou_Front"
    let baseColor = green01
    private var questions : [String] = [
        "Would you rather lose your sight or your memories?",
        "Would you rather team up with Wonder Woman or Captain Marvel?",
        "Would you rather lose the ability to read or lose the ability to speak?",
        "Would you rather ask your ex or a total stranger for a favor?",
        "Would you rather be the funniest person in a room or the smartest person in a room?",
        "Would you rather hear a comforting lie or an uncomfortable truth?",
        "Would you rather find your soulmate or your calling?",
        "Would you rather give up coffee or soda forever?",
        "Would you rather never age physically or never age mentally?",
        "Would you rather give up the Internet or showering for a month?"
    ]
    private var availableQuestions : [String] = [
        "Would you rather lose your sight or your memories?",
        "Would you rather team up with Wonder Woman or Captain Marvel?",
        "Would you rather lose the ability to read or lose the ability to speak?",
        "Would you rather ask your ex or a total stranger for a favor?",
        "Would you rather be the funniest person in a room or the smartest person in a room?",
        "Would you rather hear a comforting lie or an uncomfortable truth?",
        "Would you rather find your soulmate or your calling?",
        "Would you rather give up coffee or soda forever?",
        "Would you rather never age physically or never age mentally?",
        "Would you rather give up the Internet or showering for a month?"
    ]
    
    func getQuestion() -> Floor {
        
        if availableQuestions.isEmpty {
            availableQuestions = questions
        }
        
        let randomIndex = Int.random(in: 0..<availableQuestions.count)
        let pickedQuestion = availableQuestions[randomIndex]
        availableQuestions.remove(at: randomIndex)
        
        return Floor(gameType: self.title, question: pickedQuestion, helpImage: self.helpImage, cardImage: self.cardImage, cardBaseColor: baseColor)
    }
    
}
