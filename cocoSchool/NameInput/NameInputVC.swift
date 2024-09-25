//
//  NameInputVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 16.04.2023..
//

import Foundation
import UIKit

struct Players {
    static var playerOneName = ""
    static var playerTwoName = ""
    static var playerThreeName = ""
    static var playerFourName = ""
}

class NameInputViewController: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var upperStackView: UIStackView!
    @IBOutlet weak var lowerStackView: UIStackView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var p1NameTextField: UITextField!
    @IBOutlet weak var p2NameTextField: UITextField!
    @IBOutlet weak var p3NameTextField: UITextField!
    @IBOutlet weak var p4NameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Natrag", style: .plain, target: self, action: #selector(backButtonPressed))

        navigationItem.leftBarButtonItem = backButton
        
        configureStartButton()
        configureScreen()
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    func configureStartButton() {
        startButton.isEnabled = false
        startButton.layer.cornerRadius = 15.0
        startButton.layer.masksToBounds = true
    }
    
    func validateTextFields() -> Bool {
        let nameLength = {
            switch Settings.brojIgraca {
            case 1:
                return self.p1NameTextField.text?.count ?? 0 > 2
            case 2:
                return self.p1NameTextField.text?.count ?? 0 > 2 && self.p2NameTextField.text?.count ?? 0 > 2
            case 3:
                return self.p1NameTextField.text?.count ?? 0 > 2 && self.p2NameTextField.text?.count ?? 0 > 2 && self.p3NameTextField.text?.count ?? 0 > 2
            case 4:
                return self.p1NameTextField.text?.count ?? 0 > 2 && self.p2NameTextField.text?.count ?? 0 > 2 && self.p3NameTextField.text?.count ?? 0 > 2 && self.p4NameTextField.text?.count ?? 0 > 2
            default:
                return false
            }
        }
        
        let namesEmpty = {
            switch Settings.brojIgraca {
            case 1:
                return self.p1NameTextField.text != ""
            case 2:
                return self.p1NameTextField.text != "" && self.p2NameTextField.text != ""
            case 3:
                return self.p1NameTextField.text != "" && self.p2NameTextField.text != "" && self.p3NameTextField.text != ""
            case 4:
                return self.p1NameTextField.text != "" && self.p2NameTextField.text != "" && self.p3NameTextField.text != "" && self.p4NameTextField.text != ""
            default:
                return false
            }
        }
        
        return nameLength() && namesEmpty()
    }
    
    @IBAction func textFieldEdited(_ sender: Any) {
        
        startButton.isEnabled = validateTextFields()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        switch Settings.brojIgraca {
        case 1:
            Players.playerOneName = p1NameTextField.text ?? ""
        case 2:
            Players.playerOneName = p1NameTextField.text ?? ""
            Players.playerTwoName = p2NameTextField.text ?? ""
        case 3:
            Players.playerOneName = p1NameTextField.text ?? ""
            Players.playerTwoName = p2NameTextField.text ?? ""
            Players.playerThreeName = p3NameTextField.text ?? ""
        case 4:
            Players.playerOneName = p1NameTextField.text ?? ""
            Players.playerTwoName = p2NameTextField.text ?? ""
            Players.playerThreeName = p3NameTextField.text ?? ""
            Players.playerFourName = p4NameTextField.text ?? ""
        default:
            return
        }
    }
    
    func configureScreen() {
        
        if Settings.brojIgraca != 4 {
            mainStackView.removeArrangedSubview(p4NameTextField)
            p4NameTextField.removeFromSuperview()
            
            if Settings.brojIgraca != 3 {
                mainStackView.removeArrangedSubview(p3NameTextField)
                p3NameTextField.removeFromSuperview()
                
                if Settings.brojIgraca != 2 {
                    mainStackView.removeArrangedSubview(upperStackView)
                    upperStackView.removeFromSuperview()
                }
            }
        }
    }
}
