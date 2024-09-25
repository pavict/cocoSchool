//
//  Score.swift
//  cocoSchool
//
//  Created by Toni Pavic on 26.03.2023..
//

import Foundation

class Score {
    let task: String
    let answer: Int
    let correctAnswer: Int
    let isCorrect: Bool
    let time: Int
    
    init(task: String, answer: Int, correctAnswer: Int, isCorrect: Bool, time: Int) {
        self.task = task
        self.answer = answer
        self.correctAnswer = correctAnswer
        self.isCorrect = isCorrect
        self.time = time
    }
}
