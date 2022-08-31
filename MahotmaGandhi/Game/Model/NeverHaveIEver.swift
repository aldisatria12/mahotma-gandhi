//
//  NeverHaveIEver.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class NeverHaveIEver {
    let title = "Never Have I Ever"
    let helpImage = ""
    let cardImage = "Card_NeverHave_Front"
    let baseColor = purple01
    private var questions : [String] = [
        "Never Have I Ever farted in a classroom.",
        "xxxx"
    ]
    private var availableQuestions : [String] = [
        "Never Have I Ever farted in a classroom.",
        "xxxx"
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
