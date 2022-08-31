//
//  NeverHaveIEver.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 25/08/22.
//

import Foundation

class NeverHaveIEver {
    let title = "Never Have I Ever"
    let helpImage = "Card_NeverHave_Guide"
    let cardImage = "Card_NeverHave_Front"
    let baseColor = purple01
    private var questions : [String] = [
        "Never have I ever gone on a road trip",
        "Never have I ever broken up with someone",
        "Never have I ever lied about my age",
        "Never have I ever ghosted someone",
        "Never have I ever met someone famous",
        "Never have I ever regifted a gift",
        "Never have I ever fallen asleep in public",
        "Never have I ever laughed so hard I, um, peed my pants as an adult",
        "Never have I ever skipped shower for a day",
        "Never have I ever been the alibi for a lying friend"
    ]
    private var availableQuestions : [String] = [
        "Never have I ever gone on a road trip",
        "Never have I ever broken up with someone",
        "Never have I ever lied about my age",
        "Never have I ever ghosted someone",
        "Never have I ever met someone famous",
        "Never have I ever regifted a gift",
        "Never have I ever fallen asleep in public",
        "Never have I ever laughed so hard I, um, peed my pants as an adult",
        "Never have I ever skipped shower for a day",
        "Never have I ever been the alibi for a lying friend"
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
