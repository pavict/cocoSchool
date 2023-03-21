//
//  SettingsVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 22.02.2023..
//

import UIKit

public struct Settings {
    public var zbrajanje = false
    public var oduzimanje = true
    public var mnozenje = true
    public var dijeljenje = true
    public var raspon = 50
}

public var range = 50

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var zbrajanjeSwitch: UISwitch!
    @IBOutlet weak var oduzimanjeSwitch: UISwitch!
    @IBOutlet weak var mnozenjeSwitch: UISwitch!
    @IBOutlet weak var dijeljenjeSwitch: UISwitch!
    @IBOutlet weak var rasponSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = Settings()
        zbrajanjeSwitch.isOn = settings.zbrajanje
        oduzimanjeSwitch.isOn = settings.oduzimanje
        mnozenjeSwitch.isOn = settings.mnozenje
        dijeljenjeSwitch.isOn = settings.dijeljenje
        rasponSlider.value = Float(range)
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let step: Float = 1
        let currentValue = round(sender.value / step) * step
        range = Int(currentValue)
        print(range)
    }
}
