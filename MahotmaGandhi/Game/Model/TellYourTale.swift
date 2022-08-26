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
    private var questions : [String] = []
    private var availableQuestions : [String] = []
    
    func getQuestion() -> Floor {
        return Floor(gameType: self.title, question: "", helpText: self.helpText)
    }
    
}
