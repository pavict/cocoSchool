//
//  ViewController.swift
//  cocoSchool
//
//  Created by Toni Pavic on 31.01.2023..
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGameButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showTest", sender: self)
    }
    
    @IBAction func pushSettingsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showSettings", sender: self)
    }
    
    
}

