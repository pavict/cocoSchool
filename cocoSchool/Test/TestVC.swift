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

class TestViewController: UIViewController {
    
    // MARK: - Player Views Outlets
    @IBOutlet weak var p1View: UIView!
    @IBOutlet weak var p2View: UIView!
    @IBOutlet weak var p3View: UIView!
    
    // MARK: - Keyboards Outlets
    @IBOutlet weak var keyboardP1: UIStackView!
    
    // MARK: - Player Task Labels Outlets
    @IBOutlet weak var p1TaskLabel: UILabel!
    @IBOutlet weak var p2TaskLabel: UILabel!
    @IBOutlet weak var p3TaskLabel: UILabel!
    @IBOutlet weak var p1ResultLabel: UILabel!
    
    
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
    
    // GENERATING RANDOM OPERATORS
    let firstOperator = Operacije.allCases.randomElement()
    let secondOperator = Operacije.allCases.randomElement()
    let thirdOperator = Operacije.allCases.randomElement()
    let fourthOperator = Operacije.allCases.randomElement()
    
    // CORRECT RESULTS
    var firstResultP1: Int = 0
    var firstResultP2: Int = 0
    var firstResultP3: Int = 0
    
    var isP1Correct: Bool = false
    var isP2Correct: Bool = false
    var isP3Correct: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p2View.rotate(angle:180)
        p3View.rotate(angle: 180)
//        rotateScreenPlayerOne()
        
        
        configureP1Keyboard()
        configureP2Keyboard()
        configureP3Keyboard()
        
        generateTaskP1()
        generateTasksP2()
        generateTasksP3()
    }
    
    @objc func doneP1ButtonPressed(_ sender: Any) {
        let p1Answer = Int(p1ResultLabel.text ?? "0")
        
        if (p1Answer == firstResultP1) {
            doneButtonP1.tintColor = .green
            
            if isP2Correct {
                dismiss(animated: true)
            }
            isP1Correct = true
        } else {
            doneButtonP1.tintColor = .red
            isP1Correct = false
        }
    }
    
    @objc func doneP2ButtonPressed(_ sender: Any) {
//        let p2Answer = Int(firstTaskResultP2.text ?? "0")
//
//        let isEverythingCorrect: Bool = {
//            if (firstAnswer == firstResultP1) { return true } else { return false }
//        }()
//
//        if isEverythingCorrect {
//            doneButtonP2.tintColor = .green
//
//            if isP1Correct {
//                dismiss(animated: true)
//            }
//        } else {
//            doneButtonP2.tintColor = .red
//        }
//
//        isP2Correct = isEverythingCorrect
    }
    
    func generateTaskP1 () {
        let firstNumber = generateNumber()
        let secondNumber = generateNumber()
        
        switch firstOperator {
        case .zbrajanje:
            firstResultP1 = firstNumber + secondNumber
        case .oduzimanje:
            firstResultP1 = firstNumber - secondNumber
        case .none:
            break
        }
        
        let firstTask = "\(firstNumber) \(firstOperator!.rawValue) \(secondNumber) ="
        
        p1TaskLabel.text = firstTask
    }
    
    func generateTasksP2() {
//        let numbers = generateNumbers(8)
//
//        switch firstOperator {
//        case .zbrajanje:
//            firstResultP2 = numbers[0] + numbers[1]
//        case .oduzimanje:
//            firstResultP2 = numbers[0] - numbers[1]
//        case .none:
//            break
//        }
//
//        let firstTask = "\(numbers[0]) \(firstOperator!.rawValue) \(numbers[1]) ="
//        let secondTask = "\(numbers[2]) \(secondOperator!.rawValue) \(numbers[3]) ="
//        let thirdTask = "\(numbers[4]) \(thirdOperator!.rawValue) \(numbers[5]) ="
//        let fourthTask = "\(numbers[6]) \(fourthOperator!.rawValue) \(numbers[7]) ="
//
//        p2TaskLabel.text = firstTask
    }
    
    func generateTasksP3() {
//        let numbers = generateNumbers(8)
//
//        switch firstOperator {
//        case .zbrajanje:
//            firstResultP3 = numbers[0] + numbers[1]
//        case .oduzimanje:
//            firstResultP3 = numbers[0] - numbers[1]
//        case .none:
//            break
//        }
//        switch secondOperator {
//        case .zbrajanje:
//            secondResultP3 = numbers[2] + numbers[3]
//        case .oduzimanje:
//            secondResultP3 = numbers[2] - numbers[3]
//        case .none:
//            break
//        }
//
//        switch thirdOperator {
//        case .zbrajanje:
//            thirdResultP3 = numbers[4] + numbers[5]
//        case .oduzimanje:
//            thirdResultP3 = numbers[4] - numbers[5]
//        case .none:
//            break
//        }
//
//        switch fourthOperator {
//        case .zbrajanje:
//            fourthResultP3 = numbers[6] + numbers[7]
//        case .oduzimanje:
//            fourthResultP3 = numbers[6] - numbers[7]
//        case .none:
//            break
//        }
//
//        let firstTask = "\(numbers[0]) \(firstOperator!.rawValue) \(numbers[1]) ="
//        let secondTask = "\(numbers[2]) \(secondOperator!.rawValue) \(numbers[3]) ="
//        let thirdTask = "\(numbers[4]) \(thirdOperator!.rawValue) \(numbers[5]) ="
//        let fourthTask = "\(numbers[6]) \(fourthOperator!.rawValue) \(numbers[7]) ="
//
//        p3TaskLabel.text = firstTask
    }
    
    func generateNumber() -> Int {
        return Int.random(in: rangeMin...rangeMax)
    }
    
    func rotateScreenPlayerOne() {
//        tasksP1.rotate(angle: 270)
//        keyboardP1.rotate(angle: 270)
    }
    
    func configureP1Keyboard() {
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
    
    @objc func p1KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p1ResultLabel.text! += value
    }
    
    @objc func deleteP1ButtonAction(sender: UIButton) {
        p1ResultLabel.text = String(p1ResultLabel.text!.dropLast())
    }
    
    @objc func p2KeyboardAction(sender: UIButton) {
//        guard let value = sender.titleLabel?.text else { return }
//
//        print(sender)
//
//        if firstTaskResultP2.isEditing {
//            firstTaskResultP2.text! += value
//        }
    }
    
    @objc func deleteP2ButtonAction(sender: UIButton) {
//        if firstTaskResultP2.isEditing {
//            firstTaskResultP2.text = String(firstTaskResultP2.text!.dropLast())
//        }
    }
    
    @objc func p3KeyboardAction(sender: UIButton) {
//        guard let value = sender.titleLabel?.text else { return }
//
//        print(sender)
//
//        if firstTastResultP3.isEditing {
//            firstTastResultP3.text! += value
//        }
    }
    
    @objc func deleteP3ButtonAction(sender: UIButton) {
//        if firstTastResultP3.isEditing {
//            firstTastResultP3.text = String(firstTastResultP3.text!.dropLast())
//        }
    }
}

// MARK: - UIView Extension
extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = CGAffineTransformRotate(self.transform, radians);
        self.transform = rotation
    }
}
