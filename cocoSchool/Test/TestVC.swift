//
//  TestVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 22.02.2023..
//

import Foundation
import UIKit

enum PlayerOneOrientation {
    case normal
    case rotated
}

enum Operacije: String, CaseIterable {
    case zbrajanje = "+"
    case oduzimanje = "-"
//    case mnozenje = "*"
//    case dijeljenje = ":"
}

// MARK: - TEST VIEW CONTROLLER
class TestViewController: UIViewController {
    
    // MARK: - Player Views Outlets
    @IBOutlet weak var p1View: UIView!
    @IBOutlet weak var p2View: UIView!
    @IBOutlet weak var p3View: UIView!
    @IBOutlet weak var p4View: UIView!
    
    // MARK: - Keyboards Outlets
    @IBOutlet weak var keyboardP1: UIStackView!
    
    // MARK: - Player Task Labels Outlets
    @IBOutlet weak var p1TaskLabel: UILabel!
    @IBOutlet weak var p2TaskLabel: UILabel!
    @IBOutlet weak var p3TaskLabel: UILabel!
    @IBOutlet weak var p4TaskLabel: UILabel!
    @IBOutlet weak var p1ResultLabel: UILabel!
    @IBOutlet weak var p2ResultLabel: UILabel!
    @IBOutlet weak var p3ResultLabel: UILabel!
    @IBOutlet weak var p4ResultLabel: UILabel!
    
    // MARK: - P1 keyboard
    @IBOutlet weak var numberOneP1: UIButton!
    @IBOutlet weak var numberTwoP1: UIButton!
    @IBOutlet weak var numberThreeP1: UIButton!
    @IBOutlet weak var numberFourP1: UIButton!
    @IBOutlet weak var numberFiveP1: UIButton!
    @IBOutlet weak var numberSixP1: UIButton!
    @IBOutlet weak var numberSevenP1: UIButton!
    @IBOutlet weak var numberEightP1: UIButton!
    @IBOutlet weak var numberNineP1: UIButton!
    @IBOutlet weak var numberZeroP1: UIButton!
    @IBOutlet weak var deleteP1: UIButton!
    @IBOutlet weak var doneButtonP1: UIButton!
    
    // MARK: - P2 keyboard
    @IBOutlet weak var numberOneP2: UIButton!
    @IBOutlet weak var numberTwoP2: UIButton!
    @IBOutlet weak var numberThreeP2: UIButton!
    @IBOutlet weak var numberFourP2: UIButton!
    @IBOutlet weak var numberFiveP2: UIButton!
    @IBOutlet weak var numberSixP2: UIButton!
    @IBOutlet weak var numberSevenP2: UIButton!
    @IBOutlet weak var numberEightP2: UIButton!
    @IBOutlet weak var numberNineP2: UIButton!
    @IBOutlet weak var numberZeroP2: UIButton!
    @IBOutlet weak var deleteP2: UIButton!
    @IBOutlet weak var doneButtonP2: UIButton!
    
    // MARK: - P3 keyboard
    @IBOutlet weak var numberOneP3: UIButton!
    @IBOutlet weak var numberTwoP3: UIButton!
    @IBOutlet weak var numberThreeP3: UIButton!
    @IBOutlet weak var numberFourP3: UIButton!
    @IBOutlet weak var numberFiveP3: UIButton!
    @IBOutlet weak var numberSixP3: UIButton!
    @IBOutlet weak var numberSevenP3: UIButton!
    @IBOutlet weak var numberEightP3: UIButton!
    @IBOutlet weak var numberNineP3: UIButton!
    @IBOutlet weak var numberZeroP3: UIButton!
    @IBOutlet weak var deleteP3: UIButton!
    @IBOutlet weak var doneButtonP3: UIButton!
    
    // MARK: - P4 keyboard
    @IBOutlet weak var numberOneP4: UIButton!
    @IBOutlet weak var numberTwoP4: UIButton!
    @IBOutlet weak var numberThreeP4: UIButton!
    @IBOutlet weak var numberFourP4: UIButton!
    @IBOutlet weak var numberFiveP4: UIButton!
    @IBOutlet weak var numberSixP4: UIButton!
    @IBOutlet weak var numberSevenP4: UIButton!
    @IBOutlet weak var numberEightP4: UIButton!
    @IBOutlet weak var numberNineP4: UIButton!
    @IBOutlet weak var numberZeroP4: UIButton!
    @IBOutlet weak var deleteP4: UIButton!
    @IBOutlet weak var doneButtonP4: UIButton!
    
    // MARK: - Correct Result Variables
    var resultP1: Int = 0
    var resultP2: Int = 0
    var resultP3: Int = 0
    var resultP4: Int = 0
    
    // MARK: - Is Player Correct Variables
    var isP1Correct: Bool = false
    var isP2Correct: Bool = false
    var isP3Correct: Bool = false
    var isP4Correct: Bool = false
    
    // MARK: - OPERATORS TODO
    let firstOperator = Operacije.allCases.randomElement()
    let secondOperator = Operacije.allCases.randomElement()
    let thirdOperator = Operacije.allCases.randomElement()
    let fourthOperator = Operacije.allCases.randomElement()
    
    // MARK: - Class lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p2View.rotate(angle:180)
        p3View.rotate(angle: 180)
        
        configureP1Keyboard()
        configureP2Keyboard()
        configureP3Keyboard()
        configureP4Keyboard()
        
        generateTaskP1()
        generateTasksP2()
        generateTasksP3()
        generateTasksP4()
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    // MARK: - Generating tasks
    func generateTaskP1 () {
        let firstNumber = generateNumber()
        let secondNumber = generateNumber()
        
        switch firstOperator {
        case .zbrajanje:
            resultP1 = firstNumber + secondNumber
        case .oduzimanje:
            resultP1 = firstNumber - secondNumber
        case .none:
            break
        }
        
        let task = "\(firstNumber) \(firstOperator!.rawValue) \(secondNumber) ="
        
        p1TaskLabel.text = task
    }
    
    func generateTasksP2() {
        let firstNumber = generateNumber()
        let secondNumber = generateNumber()

        switch secondOperator {
        case .zbrajanje:
            resultP2 = firstNumber + secondNumber
        case .oduzimanje:
            resultP2 = firstNumber - secondNumber
        case .none:
            break
        }

        let task = "\(firstNumber) \(secondOperator!.rawValue) \(secondNumber) ="

        p2TaskLabel.text = task
    }
    
    func generateTasksP3() {
        let firstNumber = generateNumber()
        let secondNumber = generateNumber()

        switch thirdOperator {
        case .zbrajanje:
            resultP3 = firstNumber + secondNumber
        case .oduzimanje:
            resultP3 = firstNumber - secondNumber
        case .none:
            break
        }

        let task = "\(firstNumber) \(thirdOperator!.rawValue) \(secondNumber) ="

        p3TaskLabel.text = task
    }
    
    func generateTasksP4() {
        let firstNumber = generateNumber()
        let secondNumber = generateNumber()

        switch thirdOperator {
        case .zbrajanje:
            resultP4 = firstNumber + secondNumber
        case .oduzimanje:
            resultP4 = firstNumber - secondNumber
        case .none:
            break
        }

        let task = "\(firstNumber) \(fourthOperator!.rawValue) \(secondNumber) ="

        p4TaskLabel.text = task
    }
    
    // MARK: - Generating Numbers
    func generateNumber() -> Int {
        return Int.random(in: rangeMin...rangeMax)
    }
    
    // MARK: - ROTATION TODO
    func rotateScreenPlayerOne() {
//        tasksP1.rotate(angle: 270)
//        keyboardP1.rotate(angle: 270)
    }
    
    // MARK: - Keyboard configurations
    func configureP1Keyboard() {
        doneButtonP1.addTarget(self, action: #selector(doneButtonPressedP1(sender:)), for: .touchUpInside)
        deleteP1.addTarget(self, action: #selector(deleteP1ButtonAction(sender:)), for: .touchUpInside)

        numberOneP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberTwoP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberThreeP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberFourP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberFiveP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberSixP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberSevenP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberEightP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberNineP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
        numberZeroP1.addTarget(self, action: #selector(p1KeyboardAction(sender:)), for: .touchUpInside)
    }
    
    func configureP2Keyboard() {
        deleteP2.addTarget(self, action: #selector(deleteP2ButtonAction(sender:)), for: .touchUpInside)

        numberOneP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberTwoP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberThreeP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberFourP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberFiveP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberSixP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberSevenP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberEightP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberNineP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
        numberZeroP2.addTarget(self, action: #selector(p2KeyboardAction(sender:)), for: .touchUpInside)
    }
    
    func configureP3Keyboard() {
        deleteP3.addTarget(self, action: #selector(deleteP3ButtonAction(sender:)), for: .touchUpInside)

        numberOneP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberTwoP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberThreeP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberFourP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberFiveP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberSixP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberSevenP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberEightP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberNineP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
        numberZeroP3.addTarget(self, action: #selector(p3KeyboardAction(sender:)), for: .touchUpInside)
    }
    
    func configureP4Keyboard() {
        deleteP4.addTarget(self, action: #selector(deleteP4ButtonAction(sender:)), for: .touchUpInside)

        numberOneP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberTwoP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberThreeP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberFourP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberFiveP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberSixP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberSevenP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberEightP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberNineP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
        numberZeroP4.addTarget(self, action: #selector(p4KeyboardAction(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Keyboard Actions
    @objc func p1KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p1ResultLabel.text! += value
    }
    
    @objc func deleteP1ButtonAction(sender: UIButton) {
        p1ResultLabel.text = String(p1ResultLabel.text!.dropLast())
    }
    
    @objc func doneButtonPressedP1(sender: UIButton) {
        let p1Answer = Int(p1ResultLabel.text ?? "0")
        
        if (p1Answer == resultP1) {
            doneButtonP1.backgroundColor = .green
            isP1Correct = true
        } else {
            doneButtonP1.backgroundColor = .red
            isP1Correct = false
        }
    }
    
    @objc func p2KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p2ResultLabel.text! += value
    }
    
    @objc func deleteP2ButtonAction(sender: UIButton) {
        p2ResultLabel.text = String(p2ResultLabel.text!.dropLast())
    }
    
    @objc func p3KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p3ResultLabel.text! += value
    }
    
    @objc func deleteP3ButtonAction(sender: UIButton) {
        p2ResultLabel.text = String(p2ResultLabel.text!.dropLast())
    }
    
    @objc func p4KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p4ResultLabel.text! += value
    }
    
    @objc func deleteP4ButtonAction(sender: UIButton) {
        p4ResultLabel.text = String(p4ResultLabel.text!.dropLast())
    }
}

// MARK: - Rotation Extension
extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = CGAffineTransformRotate(self.transform, radians);
        self.transform = rotation
    }
}
