//
//  NeverHaveIEver.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class NeverHaveIEver {
    let title = "Never Have I Ever"
    let helpText = ""
    private var questions : [String] = [""]
    private var availableQuestions : [String] = [""]
    
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
