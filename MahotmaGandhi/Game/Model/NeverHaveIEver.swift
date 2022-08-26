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
    private var questions : [String] = []
    private var availableQuestions : [String] = []
    
    func getQuestion() -> Floor {
        return Floor(gameType: self.title, question: "", helpText: self.helpText)
    }
    
}
