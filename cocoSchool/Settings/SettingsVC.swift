//
//  SettingsVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 22.02.2023..
//

import UIKit
import RangeSeekSlider

public var zbrajanjeActivated = true
public var oduzimanjeActivated = true
public var mnozenjeActivated = false
public var dijeljenjeActivated = false
public var rangeMin = 10
public var rangeMax = 500
public var brojIgraca = 3
public var timeLimit = "5"

class SettingsViewController: UIViewController, RangeSeekSliderDelegate {
    
    @IBOutlet weak var zbrajanjeSwitch: UISwitch!
    @IBOutlet weak var oduzimanjeSwitch: UISwitch!
    @IBOutlet weak var mnozenjeSwitch: UISwitch!
    @IBOutlet weak var dijeljenjeSwitch: UISwitch!
    @IBOutlet weak var rasponSlider: RangeSeekSlider!
    @IBOutlet weak var brojIgracaSlider: UISlider!
    @IBOutlet weak var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSettings()
    }
    
    func configureSettings() {
        zbrajanjeSwitch.isOn = zbrajanjeActivated
        oduzimanjeSwitch.isOn = oduzimanjeActivated
        mnozenjeSwitch.isOn = mnozenjeActivated
        dijeljenjeSwitch.isOn = dijeljenjeActivated
        
        rasponSlider.selectedMinValue = CGFloat(rangeMin)
        rasponSlider.selectedMaxValue = CGFloat(rangeMax)
        brojIgracaSlider.value = Float(brojIgraca)
        
        timeTextField.text = timeLimit
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func brojIgracaValueChanged(_ sender: Any) {
        let step: Float = 1
        let currentValue = round(brojIgracaSlider.value / step) * step
        brojIgracaSlider.value = currentValue
        
        brojIgraca = Int(brojIgracaSlider.value)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        rangeMin = Int(rasponSlider.selectedMinValue)
        rangeMax = Int(rasponSlider.selectedMaxValue)
    }
    @IBAction func timeTextFieldChanged(_ sender: Any) {
        timeLimit = timeTextField.text ?? "5"
    }
}
