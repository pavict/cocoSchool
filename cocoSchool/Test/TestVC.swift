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
//    case dijeljenje = "/"
}

class TestViewController: UIViewController {
    
    //VIEWS
    @IBOutlet weak var p1View: UIView!
    @IBOutlet weak var p2View: UIView!
    @IBOutlet weak var p3View: UIView!
    
    // ELEMENTS
    @IBOutlet weak var tasksP1: UIStackView!
    @IBOutlet weak var keyboardP1: UIStackView!
    
    // PLAYER ONE LABELS
    @IBOutlet weak var firstTaskLabelP1: UILabel!
    @IBOutlet weak var secondTaskLabelP1: UILabel!
    @IBOutlet weak var thirdTaskLabelP1: UILabel!
    @IBOutlet weak var fourthTaskLabelP1: UILabel!
    
    // PLAYER TWO LABELS
    @IBOutlet weak var firstTaskLabelP2: UILabel!
    @IBOutlet weak var secondTaskLabelP2: UILabel!
    @IBOutlet weak var thirdTaskLabelP2: UILabel!
    @IBOutlet weak var fourthTaskLabelP2: UILabel!
    
    // PLAYER THREE LABELS
    @IBOutlet weak var firstTaskLabelP3: UILabel!
    @IBOutlet weak var secondTaskLabelP3: UILabel!
    @IBOutlet weak var thirdTaskLabelP3: UILabel!
    @IBOutlet weak var fourthTaskLabelP3: UILabel!
    
    // PLAYER ONE TEXTFIELDS
    @IBOutlet weak var firstTaskResultP1: UITextField!
    @IBOutlet weak var secondTaskResultP1: UITextField!
    @IBOutlet weak var thirdTaskResultP1: UITextField!
    @IBOutlet weak var fourthTaskResultP1: UITextField!
    
    // PLAYER TWO TEXTFIELDS
    @IBOutlet weak var firstTaskResultP2: UITextField!
    @IBOutlet weak var secondTaskResultP2: UITextField!
    @IBOutlet weak var thirdTaskResultP2: UITextField!
    @IBOutlet weak var fourthTaskResultP2: UITextField!
    
    // PLAYER THREE TEXTFIELDS
    @IBOutlet weak var firstTastResultP3: UITextField!
    @IBOutlet weak var secondTastResultP3: UITextField!
    @IBOutlet weak var thirdTaskResultP3: UITextField!
    @IBOutlet weak var fourthTaskResultP3: UITextField!
    
    // PLAYER ONE KEYBOARD
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
    
    // PLAYER TWO KEYBOARD
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
    
    // PLAYER THREE KEYBOARD
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
    var secondResultP1: Int = 0
    var thirdResultP1: Int = 0
    var fourthResultP1: Int = 0
    
    var firstResultP2: Int = 0
    var secondResultP2: Int = 0
    var thirdResultP2: Int = 0
    var fourthResultP2: Int = 0
    
    var firstResultP3: Int = 0
    var secondResultP3: Int = 0
    var thirdResultP3: Int = 0
    var fourthResultP3: Int = 0
    
    var allCorrectP1: Bool = false
    var allCorrectP2: Bool = false
    var allCorrectP3: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p2View.rotate(angle:180)
        p3View.rotate(angle: 180)
//        rotateScreenPlayerOne()
        
        
        configureP1Keyboard()
        configureP2Keyboard()
        configureP3Keyboard()
        
        generateTasksP1()
        generateTasksP2()
        generateTasksP3()
    }
    
    @objc func doneP1ButtonPressed(_ sender: Any) {
        
        let firstAnswer = Int(firstTaskResultP1.text ?? "0")
        let secondAnswer = Int(secondTaskResultP1.text ?? "0")
        let thirdAnswer = Int(thirdTaskResultP1.text ?? "0")
        let fourthAnswer = Int(fourthTaskResultP1.text ?? "0")
        
        let isEverythingCorrect: Bool = {
            if (firstAnswer == firstResultP1 && secondAnswer == secondResultP1 && thirdAnswer == thirdResultP1 && fourthAnswer == fourthResultP1) { return true } else { return false }
        }()
        
        if isEverythingCorrect {
            doneButtonP1.tintColor = .green
            
            if allCorrectP2 {
                dismiss(animated: true)
            }
        } else {
            doneButtonP1.tintColor = .red
        }
        allCorrectP1 = isEverythingCorrect
    }
    
    @objc func doneP2ButtonPressed(_ sender: Any) {
        let firstAnswer = Int(firstTaskResultP2.text ?? "0")
        let secondAnswer = Int(secondTaskResultP2.text ?? "0")
        let thirdAnswer = Int(thirdTaskResultP2.text ?? "0")
        let fourthAnswer = Int(fourthTaskResultP2.text ?? "0")
        
        let isEverythingCorrect: Bool = {
            if (firstAnswer == firstResultP1 && secondAnswer == secondResultP1 && thirdAnswer == thirdResultP1 && fourthAnswer == fourthResultP1) { return true } else { return false }
        }()
        
        if isEverythingCorrect {
            doneButtonP2.tintColor = .green
            
            if allCorrectP1 {
                dismiss(animated: true)
            }
        } else {
            doneButtonP2.tintColor = .red
        }
        
        allCorrectP2 = isEverythingCorrect
    }
    
    func generateTasksP1 () {
        let numbers = generateNumbers(8)
        
        switch firstOperator {
        case .zbrajanje:
            firstResultP1 = numbers[0] + numbers[1]
        case .oduzimanje:
            firstResultP1 = numbers[0] - numbers[1]
        case .none:
            break
        }
        switch secondOperator {
        case .zbrajanje:
            secondResultP1 = numbers[2] + numbers[3]
        case .oduzimanje:
            secondResultP1 = numbers[2] - numbers[3]
        case .none:
            break
        }
        
        switch thirdOperator {
        case .zbrajanje:
            thirdResultP1 = numbers[4] + numbers[5]
        case .oduzimanje:
            thirdResultP1 = numbers[4] - numbers[5]
        case .none:
            break
        }
        
        switch fourthOperator {
        case .zbrajanje:
            fourthResultP1 = numbers[6] + numbers[7]
        case .oduzimanje:
            fourthResultP1 = numbers[6] - numbers[7]
        case .none:
            break
        }
        
        let firstTask = "\(numbers[0]) \(firstOperator!.rawValue) \(numbers[1]) ="
        let secondTask = "\(numbers[2]) \(secondOperator!.rawValue) \(numbers[3]) ="
        let thirdTask = "\(numbers[4]) \(thirdOperator!.rawValue) \(numbers[5]) ="
        let fourthTask = "\(numbers[6]) \(fourthOperator!.rawValue) \(numbers[7]) ="
        
        firstTaskLabelP1.text = firstTask
        secondTaskLabelP1.text = secondTask
        thirdTaskLabelP1.text = thirdTask
        fourthTaskLabelP1.text = fourthTask
        
        firstTaskLabelP1.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func generateTasksP2() {
        let numbers = generateNumbers(8)
        
        switch firstOperator {
        case .zbrajanje:
            firstResultP2 = numbers[0] + numbers[1]
        case .oduzimanje:
            firstResultP2 = numbers[0] - numbers[1]
        case .none:
            break
        }
        switch secondOperator {
        case .zbrajanje:
            secondResultP2 = numbers[2] + numbers[3]
        case .oduzimanje:
            secondResultP2 = numbers[2] - numbers[3]
        case .none:
            break
        }
        
        switch thirdOperator {
        case .zbrajanje:
            thirdResultP2 = numbers[4] + numbers[5]
        case .oduzimanje:
            thirdResultP2 = numbers[4] - numbers[5]
        case .none:
            break
        }
        
        switch fourthOperator {
        case .zbrajanje:
            fourthResultP2 = numbers[6] + numbers[7]
        case .oduzimanje:
            fourthResultP2 = numbers[6] - numbers[7]
        case .none:
            break
        }
        
        let firstTask = "\(numbers[0]) \(firstOperator!.rawValue) \(numbers[1]) ="
        let secondTask = "\(numbers[2]) \(secondOperator!.rawValue) \(numbers[3]) ="
        let thirdTask = "\(numbers[4]) \(thirdOperator!.rawValue) \(numbers[5]) ="
        let fourthTask = "\(numbers[6]) \(fourthOperator!.rawValue) \(numbers[7]) ="
        
        firstTaskLabelP2.text = firstTask
        secondTaskLabelP2.text = secondTask
        thirdTaskLabelP2.text = thirdTask
        fourthTaskLabelP2.text = fourthTask
    }
    
    func generateTasksP3() {
        let numbers = generateNumbers(8)
        
        switch firstOperator {
        case .zbrajanje:
            firstResultP3 = numbers[0] + numbers[1]
        case .oduzimanje:
            firstResultP3 = numbers[0] - numbers[1]
        case .none:
            break
        }
        switch secondOperator {
        case .zbrajanje:
            secondResultP3 = numbers[2] + numbers[3]
        case .oduzimanje:
            secondResultP3 = numbers[2] - numbers[3]
        case .none:
            break
        }
        
        switch thirdOperator {
        case .zbrajanje:
            thirdResultP3 = numbers[4] + numbers[5]
        case .oduzimanje:
            thirdResultP3 = numbers[4] - numbers[5]
        case .none:
            break
        }
        
        switch fourthOperator {
        case .zbrajanje:
            fourthResultP3 = numbers[6] + numbers[7]
        case .oduzimanje:
            fourthResultP3 = numbers[6] - numbers[7]
        case .none:
            break
        }
        
        let firstTask = "\(numbers[0]) \(firstOperator!.rawValue) \(numbers[1]) ="
        let secondTask = "\(numbers[2]) \(secondOperator!.rawValue) \(numbers[3]) ="
        let thirdTask = "\(numbers[4]) \(thirdOperator!.rawValue) \(numbers[5]) ="
        let fourthTask = "\(numbers[6]) \(fourthOperator!.rawValue) \(numbers[7]) ="
        
        firstTaskLabelP3.text = firstTask
        secondTaskLabelP3.text = secondTask
        thirdTaskLabelP3.text = thirdTask
        fourthTaskLabelP3.text = fourthTask
    }
    
    func generateNumbers(_ n: Int) -> [Int] {
        return (0..<n).map { _ in .random(in: 1...range) }
    }
    
    func rotateScreenPlayerOne() {
        tasksP1.rotate(angle: 270)
        keyboardP1.rotate(angle: 270)
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
        
        print(sender)
        
        if firstTaskResultP1.isEditing {
            firstTaskResultP1.text! += value
        }
        if secondTaskResultP1.isEditing {
            secondTaskResultP1.text! += value
        }
        if thirdTaskResultP1.isEditing {
            thirdTaskResultP1.text! += value
        }
        if fourthTaskResultP1.isEditing {
            fourthTaskResultP1.text! += value
        }
    }
    
    @objc func deleteP1ButtonAction(sender: UIButton) {
        if firstTaskResultP1.isEditing {
            firstTaskResultP1.text = String(firstTaskResultP1.text!.dropLast())
        }
        if secondTaskResultP1.isEditing {
            secondTaskResultP1.text = String(secondTaskResultP1.text!.dropLast())
        }
        if thirdTaskResultP1.isEditing {
            thirdTaskResultP1.text = String(thirdTaskResultP1.text!.dropLast())
        }
        if fourthTaskResultP1.isEditing {
            fourthTaskResultP1.text = String(fourthTaskResultP1.text!.dropLast())
        }
    }
    
    @objc func p2KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        print(sender)
        
        if firstTaskResultP2.isEditing {
            firstTaskResultP2.text! += value
        }
        if secondTaskResultP2.isEditing {
            secondTaskResultP2.text! += value
        }
        if thirdTaskResultP2.isEditing {
            thirdTaskResultP2.text! += value
        }
        if fourthTaskResultP2.isEditing {
            fourthTaskResultP2.text! += value
        }
    }
    
    @objc func deleteP2ButtonAction(sender: UIButton) {
        if firstTaskResultP2.isEditing {
            firstTaskResultP2.text = String(firstTaskResultP2.text!.dropLast())
        }
        if secondTaskResultP2.isEditing {
            secondTaskResultP2.text = String(secondTaskResultP2.text!.dropLast())
        }
        if thirdTaskResultP2.isEditing {
            thirdTaskResultP2.text = String(thirdTaskResultP2.text!.dropLast())
        }
        if fourthTaskResultP2.isEditing {
            fourthTaskResultP2.text = String(fourthTaskResultP2.text!.dropLast())
        }
    }
    
    @objc func p3KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        print(sender)
        
        if firstTastResultP3.isEditing {
            firstTastResultP3.text! += value
        }
        if secondTastResultP3.isEditing {
            secondTastResultP3.text! += value
        }
        if thirdTaskResultP3.isEditing {
            thirdTaskResultP3.text! += value
        }
        if fourthTaskResultP3.isEditing {
            fourthTaskResultP2.text! += value
        }
    }
    
    @objc func deleteP3ButtonAction(sender: UIButton) {
        if firstTastResultP3.isEditing {
            firstTastResultP3.text = String(firstTastResultP3.text!.dropLast())
        }
        if secondTastResultP3.isEditing {
            secondTastResultP3.text = String(secondTastResultP3.text!.dropLast())
        }
        if thirdTaskResultP3.isEditing {
            thirdTaskResultP3.text = String(thirdTaskResultP3.text!.dropLast())
        }
        if fourthTaskResultP3.isEditing {
            fourthTaskResultP3.text = String(fourthTaskResultP3.text!.dropLast())
        }
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
