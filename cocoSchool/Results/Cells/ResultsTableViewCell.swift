//
//  ResultsTableViewCell.swift
//  cocoSchool
//
//  Created by Toni Pavic on 18.04.2023..
//

import Foundation
import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var textZadatka: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(task: Score, row: Int){
        
        taskLabel?.text = "Zadatak \(row)"
        
        textZadatka.text = "\(task.task) = \(task.answer)"
        
        if task.isCorrect {
            correctAnswerLabel?.text = "Točno!"
        } else {
            correctAnswerLabel?.text = "Rješenje je \(task.correctAnswer)"
        }
    }
}
