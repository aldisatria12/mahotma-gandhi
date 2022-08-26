//
//  TellYourTaleModel.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class TellYourTale {
    let title = "Tell Your Tale"
    let helpText = ""
    private var questions : [String] = [
        "Given the choice of anyone in the world, whom would you want as a dinner guest?",
        "xxx"
    ]
    private var availableQuestions : [String] = [
        "Given the choice of anyone in the world, whom would you want as a dinner guest?",
        "xxx"
    ]
    
    func getQuestion() -> Floor {
        if availableQuestions.isEmpty {
            availableQuestions = questions
        }
        
        let randomIndex = Int.random(in: 0..<availableQuestions.count)
        let pickedQuestion = availableQuestions[randomIndex]
        availableQuestions.remove(at: randomIndex)
        
        return Floor(gameType: self.title, question: pickedQuestion, helpText: self.helpText)
    }
    
}
