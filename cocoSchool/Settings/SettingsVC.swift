//
//  SettingsVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 22.02.2023..
//

import UIKit

struct Settings {
    static var brojIgraca = 4
    static var timeLimit = "1"
    static var zbrajanjeActivated = true
    static var oduzimanjeActivated = true
    static var mnozenjeActivated = false
    static var dijeljenjeActivated = false
    static var firstOperatorMin = 10
    static var firstOperatorMax = 100
    static var secondOperatorMin = 10
    static var secondOperatorMax = 100
    static var shouldFirstOperatorRoundUp = false
    static var shouldSecondOperatorRoundUp = false
    static var isFirstOperatorConstant = false
    static var isSecondOperatorConstant = false
    static var firstOperatorConstant = 10
    static var secondOperatorConstant = 10
    static var shouldFirstOperatorBeGreater = false
}

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var contentView: UIView!
    var originalFrame: CGRect?
    var isViewMovedUp = false
    
    // VIEWS
    @IBOutlet weak var playerNumberView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var operatorsView: UIView!
    @IBOutlet weak var rasponView: UIView!
    
    // TEXTFIELDS
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var firstOperatorMinTextField: UITextField!
    @IBOutlet weak var firstOperatorMaxTextField: UITextField!
    @IBOutlet weak var secondOperatorMinTextField: UITextField!
    @IBOutlet weak var secondOperatorMaxTextField: UITextField!
    @IBOutlet weak var firstOperatorConstantTextField: UITextField!
    @IBOutlet weak var secondOperatorConstantTextField: UITextField!
    
    // SWITCHES
    @IBOutlet weak var zbrajanjeSwitch: UISwitch!
    @IBOutlet weak var oduzimanjeSwitch: UISwitch!
    @IBOutlet weak var mnozenjeSwitch: UISwitch!
    @IBOutlet weak var dijeljenjeSwitch: UISwitch!
    @IBOutlet weak var firstOperatorConstantSwitch: UISwitch!
    @IBOutlet weak var secondOperatorConstantSwitch: UISwitch!
    @IBOutlet weak var firstOperatorGreaterSwitch: UISwitch!
    @IBOutlet weak var shouldFirstOperatorRoundUp: UISwitch!
    @IBOutlet weak var shouldSecondOperatorRoundUp: UISwitch!
    
    // RADIO BUTTONS
    @IBOutlet weak var onePlayerButton: RadioButton!
    @IBOutlet weak var twoPlayersButton: RadioButton!
    @IBOutlet weak var threePlayersButton: RadioButton!
    @IBOutlet weak var fourPlayersButton: RadioButton!
    
    @IBOutlet weak var potvrdiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "POSTAVKE"
        
        configureViews()
        configureRadioButtons()
        configureSettings()
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    func configureViews() {
        playerNumberView.layer.cornerRadius = 10.0
        playerNumberView.clipsToBounds = true
        
        timeView.layer.cornerRadius = 10.0
        timeView.clipsToBounds = true
        
        operatorsView.layer.cornerRadius = 10.0
        operatorsView.clipsToBounds = true
        
        rasponView.layer.cornerRadius = 10.0
        rasponView.clipsToBounds = true
        
        potvrdiButton.layer.cornerRadius = 15.0
        potvrdiButton.layer.masksToBounds = true
    }
    
    func configureRadioButtons() {
        
        onePlayerButton.layer.cornerRadius = 15.0
        onePlayerButton.layer.masksToBounds = true
        twoPlayersButton.layer.cornerRadius = 15.0
        twoPlayersButton.layer.masksToBounds = true
        threePlayersButton.layer.cornerRadius = 15.0
        threePlayersButton.layer.masksToBounds = true
        fourPlayersButton.layer.cornerRadius = 15.0
        fourPlayersButton.layer.masksToBounds = true
        
        switch Settings.brojIgraca {
        case 1:
            onePlayerButton.isSelected = true
        case 2:
            twoPlayersButton.isSelected = true
        case 3:
            threePlayersButton.isSelected = true
        case 4:
            fourPlayersButton.isSelected = true
        default:
            break
        }
        
        onePlayerButton?.alternateButton = [twoPlayersButton, threePlayersButton, fourPlayersButton]
        
        twoPlayersButton?.alternateButton = [onePlayerButton, threePlayersButton, fourPlayersButton]
        
        threePlayersButton?.alternateButton = [twoPlayersButton, onePlayerButton, fourPlayersButton]
        
        fourPlayersButton?.alternateButton = [twoPlayersButton, threePlayersButton, onePlayerButton]
        
        onePlayerButton.addTarget(self, action: #selector(brojIgracaChanged(sender:)), for: .touchUpInside)
        twoPlayersButton.addTarget(self, action: #selector(brojIgracaChanged(sender:)), for: .touchUpInside)
        threePlayersButton.addTarget(self, action: #selector(brojIgracaChanged(sender:)), for: .touchUpInside)
        fourPlayersButton.addTarget(self, action: #selector(brojIgracaChanged(sender:)), for: .touchUpInside)
    }
    
    @objc func brojIgracaChanged(sender: RadioButton){
        
        guard let noviBrojIgraca = sender.titleLabel?.text else { return }
        
        Settings.brojIgraca = Int(noviBrojIgraca) ?? 4
    }
    
    func configureSettings() {
        zbrajanjeSwitch.isOn = Settings.zbrajanjeActivated
        oduzimanjeSwitch.isOn = Settings.oduzimanjeActivated
        mnozenjeSwitch.isOn = Settings.mnozenjeActivated
        dijeljenjeSwitch.isOn = Settings.dijeljenjeActivated
        shouldFirstOperatorRoundUp.isOn = Settings.shouldFirstOperatorRoundUp
        shouldSecondOperatorRoundUp.isOn = Settings.shouldSecondOperatorRoundUp
        firstOperatorConstantSwitch.isOn = Settings.isFirstOperatorConstant
        secondOperatorConstantSwitch.isOn = Settings.isSecondOperatorConstant
        firstOperatorGreaterSwitch.isOn = Settings.shouldFirstOperatorBeGreater
        
        firstOperatorConstantTextField.isEnabled = firstOperatorConstantSwitch.isOn
        secondOperatorConstantTextField.isEnabled = secondOperatorConstantSwitch.isOn
        firstOperatorConstantTextField.text = String(Settings.firstOperatorConstant)
        secondOperatorConstantTextField.text = String(Settings.secondOperatorConstant)
        
        timeTextField.text = Settings.timeLimit
        firstOperatorMinTextField.text = String(Settings.firstOperatorMin)
        firstOperatorMaxTextField.text = String(Settings.firstOperatorMax)
        secondOperatorMinTextField.text = String(Settings.secondOperatorMin)
        secondOperatorMaxTextField.text = String(Settings.secondOperatorMax)
        
    }
    
    @IBAction func firstOperatorMinChanged(_ sender: Any) {
        Settings.firstOperatorMin = Int(firstOperatorMinTextField.text ?? "10") ?? 10
    }
    @IBAction func firstOperatorMaxChanged(_ sender: Any) {
        Settings.firstOperatorMax = Int(firstOperatorMaxTextField.text ?? "100") ?? 100
    }
    
    @IBAction func secondOperatorMinChanged(_ sender: Any) {
        Settings.secondOperatorMin = Int(secondOperatorMinTextField.text ?? "10") ?? 10
    }
    @IBAction func secondOperatorMaxChanged(_ sender: Any) {
        Settings.secondOperatorMax = Int(secondOperatorMaxTextField.text ?? "100") ?? 100
    }
    
    @IBAction func firstConstantValueChanged(_ sender: Any) {
        Settings.isFirstOperatorConstant = firstOperatorConstantSwitch.isOn
        firstOperatorConstantTextField.isEnabled = firstOperatorConstantSwitch.isOn
    }
    @IBAction func secondConstantValueChanged(_ sender: Any) {
        Settings.isSecondOperatorConstant = secondOperatorConstantSwitch.isOn
        secondOperatorConstantTextField.isEnabled = secondOperatorConstantSwitch.isOn
    }
    @IBAction func zbrajanjeSwitched(_ sender: Any) {
        Settings.zbrajanjeActivated = zbrajanjeSwitch.isOn
    }
    @IBAction func oduzimanjeSwitched(_ sender: Any) {
        Settings.oduzimanjeActivated = oduzimanjeSwitch.isOn
    }
    @IBAction func mnozenjeSwitched(_ sender: Any) {
        Settings.mnozenjeActivated = mnozenjeSwitch.isOn
    }
    @IBAction func dijeljenjeSwitched(_ sender: Any) {
        Settings.dijeljenjeActivated = dijeljenjeSwitch.isOn
    }
    
    @IBAction func timeTextFieldChanged(_ sender: Any) {
        Settings.timeLimit = timeTextField.text ?? "5"
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

