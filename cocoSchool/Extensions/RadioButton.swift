//
//  RadioButton.swift
//  cocoSchool
//
//  Created by Toni Pavic on 26.04.2023..
//

import Foundation
import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton: RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor(hex: "36387B").cgColor
                self.backgroundColor = UIColor(hex: "36387B")
                self.titleLabel?.tintColor = UIColor.white
            } else {
                self.layer.borderColor = UIColor.white.cgColor
                self.backgroundColor = UIColor.white
                self.titleLabel?.tintColor = UIColor(hex: "36387B")
            }
        }
    }
}
