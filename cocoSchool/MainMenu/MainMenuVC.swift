//
//  ViewController.swift
//  cocoSchool
//
//  Created by Toni Pavic on 31.01.2023..
//

import UIKit
import FirebaseFirestore

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var firstSettingsLabel: UILabel!
    @IBOutlet weak var secondSettingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureStartButton()
        configureBackButton()
        configureSettingsLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureSettingsLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    func configureStartButton() {
        startButton.layer.cornerRadius = 15.0
        startButton.layer.masksToBounds = true
        startButton.addShadowToBackground(color: UIColor(hex: "98245B"), opacity: 1.0)
    }
    
    func configureSettingsLabels() {
        var operatori = ""
        
        if Settings.zbrajanjeActivated {
            operatori += "+ "
        }
        if Settings.oduzimanjeActivated {
            operatori += "- "
        }
        if Settings.mnozenjeActivated {
            operatori += "* "
        }
        if Settings.dijeljenjeActivated {
            operatori += "%"
        }
        
        firstSettingsLabel.text = "Broj učenika: \(Settings.brojIgraca) | Trajanje: \(Settings.timeLimit) min | Operatori: \(operatori)"
        
        var prviOperand = "Prvi operand: "
        var drugiOperand = "Drugi operand: "
        
        if Settings.isFirstOperatorConstant {
            prviOperand += String(Settings.firstOperatorConstant)
        } else {
            prviOperand += "od \(Settings.firstOperatorMin) do \(Settings.firstOperatorMax)"
        }
        
        if Settings.isSecondOperatorConstant {
            drugiOperand += String(Settings.secondOperatorConstant)
        } else {
            drugiOperand += "od \(Settings.secondOperatorMin) do \(Settings.secondOperatorMax)"
        }
        
        secondSettingsLabel.text = "\(prviOperand) | \(drugiOperand)"
    }
    
    @IBAction func startGameButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showTest", sender: self)
    }
    
    @IBAction func pushSettingsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showSettings", sender: self)
    }
    
    
}

