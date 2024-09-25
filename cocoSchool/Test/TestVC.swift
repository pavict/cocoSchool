//
//  TestVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 22.02.2023..
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

enum Operacije: String, CaseIterable {
    case zbrajanje = "+"
    case oduzimanje = "-"
    case mnozenje = "*"
    case dijeljenje = ":"
}

// MARK: - TEST VIEW CONTROLLER
class TestViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var playerOneStackView: UIStackView!
    @IBOutlet weak var playerTwoStackView: UIStackView!
    @IBOutlet weak var playerThreeStackView: UIStackView!
    @IBOutlet weak var playerFourStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var upperStackView: UIStackView!
    
    // MARK: - Timer labels
    @IBOutlet weak var timerP1: UILabel!
    @IBOutlet weak var timerP2: UILabel!
    @IBOutlet weak var timerP3: UILabel!
    @IBOutlet weak var timerP4: UILabel!
    
    // MARK: - Player Views Outlets
    @IBOutlet weak var p1View: UIView!
    @IBOutlet weak var p2View: UIView!
    @IBOutlet weak var p3View: UIView!
    @IBOutlet weak var p4View: UIView!
    
    // MARK: - Keyboards Outlets
    @IBOutlet weak var keyboardP1: UIStackView!
    
    // MARK: - Name labels
    
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var playerThreeNameLabel: UILabel!
    @IBOutlet weak var playerFourNameLabel: UILabel!
    
    // MARK: - Player Task Labels Outlets
    @IBOutlet weak var p1TaskLabel: UILabel!
    @IBOutlet weak var p2TaskLabel: UILabel!
    @IBOutlet weak var p3TaskLabel: UILabel!
    @IBOutlet weak var p4TaskLabel: UILabel!
    @IBOutlet weak var p1ResultLabel: UITextField!
    @IBOutlet weak var p2ResultLabel: UITextField!
    @IBOutlet weak var p3ResultLabel: UITextField!
    @IBOutlet weak var p4ResultLabel: UITextField!
    
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
    
    // MARK: - Default timer seconds
    var count = 300
    
    var startTimestamp = ""
    var endTimestamp = ""
    
    var scoreP1: [Score] = []
    var scoreP2: [Score] = []
    var scoreP3: [Score] = []
    var scoreP4: [Score] = []
    
    var playerOneTaskTime = 0
    var playerTwoTaskTime = 0
    var playerThreeTaskTime = 0
    var playerFourTaskTime = 0
    
    var timer: Timer?
    
    var operationsArray = [Operacije]()
    
    // MARK: - Class lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Settings.brojIgraca == 2 {
            rotateView(contentView, byAngle: CGFloat.pi/2) // Rotate by 45 degrees
        }
        
        configureScreen()
        configureViews()
        
        setTimer()
        startTimestamp = getNowTimestamp()
        
        p2View.rotate(angle: 180)
        p3View.rotate(angle: 180)
        
        configureP1Keyboard()
        configureP2Keyboard()
        configureP3Keyboard()
        configureP4Keyboard()
        
        configureNameLabels()
        configureOperations()
        
        generateTaskP1()
        generateTaskP2()
        generateTaskP3()
        generateTaskP4()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func rotateView(_ view: UIView, byAngle angle: CGFloat) {
        view.layer.removeAllAnimations() // Remove any previous animations
        
        UIView.animate(withDuration: 0.3) {
            let rotationTransform = CGAffineTransform(rotationAngle: angle)
            view.transform = rotationTransform
        }
    }
    
    
    func getNowTimestamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
    
    // MARK: - Timer
    func setTimer() {
        switch Settings.brojIgraca {
        case 1:
            timerP1.text = String(Settings.timeLimit) + ":00"
        case 2:
            timerP1.text = String(Settings.timeLimit) + ":00"
            timerP2.text = String(Settings.timeLimit) + ":00"
        case 3:
            timerP1.text = String(Settings.timeLimit) + ":00"
            timerP2.text = String(Settings.timeLimit) + ":00"
            timerP3.text = String(Settings.timeLimit) + ":00"
            timerP4.text = String(Settings.timeLimit) + ":00"
        default:
            break
        }
        
        count = (Int(Settings.timeLimit) ?? 5) * 60 - 1
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func configureViews() {
        p1View.layer.cornerRadius = 15.0
        p1View.layer.masksToBounds = true
        
        if Settings.brojIgraca > 1 {
            p2View.layer.cornerRadius = 15.0
            p2View.layer.masksToBounds = true
        }
        if Settings.brojIgraca > 2 {
            p3View.layer.cornerRadius = 15.0
            p3View.layer.masksToBounds = true
        }
        if Settings.brojIgraca > 3 {
            p4View.layer.cornerRadius = 15.0
            p4View.layer.masksToBounds = true
        }
        
    }
    
    func configureNameLabels() {
        let playerNames = [Players.playerOneName, Players.playerTwoName, Players.playerThreeName, Players.playerFourName]

        for i in 0..<Settings.brojIgraca {
            switch i {
            case 0:
                playerOneNameLabel.text = playerNames[i]
            case 1:
                playerTwoNameLabel.text = playerNames[i]
            case 2:
                playerThreeNameLabel.text = playerNames[i]
            case 3:
                playerFourNameLabel.text = playerNames[i]
            default:
                break
            }
        }
    }
    
    @objc func update() {
        playerOneTaskTime += 1
        playerTwoTaskTime += 1
        playerThreeTaskTime += 1
        playerFourTaskTime += 1
        
        if(count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            
            switch Settings.brojIgraca {
            case 1:
                timerP1.text = minutes + ":" + seconds
            case 2:
                timerP1.text = minutes + ":" + seconds
                timerP2.text = minutes + ":" + seconds
            case 3:
                timerP1.text = minutes + ":" + seconds
                timerP2.text = minutes + ":" + seconds
                timerP3.text = minutes + ":" + seconds
            case 4:
                timerP1.text = minutes + ":" + seconds
                timerP2.text = minutes + ":" + seconds
                timerP3.text = minutes + ":" + seconds
                timerP4.text = minutes + ":" + seconds
            default:
                break
            }
            count -= 1
        } else {
            endTimestamp = getNowTimestamp()
            timer!.invalidate()
            logResults()
            moveToResultsScreen()
        }
    }
    
    func configureOperations() {
        
        if (Settings.zbrajanjeActivated) {
            operationsArray.append(Operacije.zbrajanje)
        }
        if (Settings.oduzimanjeActivated) {
            operationsArray.append(Operacije.oduzimanje)
        }
        if (Settings.mnozenjeActivated) {
            operationsArray.append(Operacije.mnozenje)
        }
        if (Settings.dijeljenjeActivated) {
            operationsArray.append(Operacije.dijeljenje)
        }
    }
    
    func moveToResultsScreen() {
        let storyboard = UIStoryboard(name: "ResultsVC", bundle: nil)
        let resultsVC = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        resultsVC.p1Results = scoreP1
        resultsVC.p2Results = scoreP2
        resultsVC.p3Results = scoreP3
        resultsVC.p4Results = scoreP4
        resultsVC.modalPresentationStyle = .fullScreen
        present(resultsVC, animated: true, completion: nil)
    }
    
    // MARK: - Log Results
    func logResults() {
        let numberOfPlayers = Settings.brojIgraca

        var playerScores: [(name: String, score: [Score])] = []

        switch numberOfPlayers {
        case 1:
            playerScores.append((name: Players.playerOneName, score: scoreP1))
        case 2:
            playerScores.append((name: Players.playerOneName, score: scoreP1))
            playerScores.append((name: Players.playerTwoName, score: scoreP2))
        case 3:
            playerScores.append((name: Players.playerOneName, score: scoreP1))
            playerScores.append((name: Players.playerTwoName, score: scoreP2))
            playerScores.append((name: Players.playerThreeName, score: scoreP3))
        case 4:
            playerScores.append((name: Players.playerOneName, score: scoreP1))
            playerScores.append((name: Players.playerTwoName, score: scoreP2))
            playerScores.append((name: Players.playerThreeName, score: scoreP3))
            playerScores.append((name: Players.playerFourName, score: scoreP4))
        default:
            break
        }

        for player in playerScores {
            var brojTocnih = 0
            var brojNetocnih = 0
            for element in player.score {
                if element.isCorrect {
                    brojTocnih += 1
                } else {
                    brojNetocnih += 1
                }
            }
            postDataToFirebase(ime: player.name, brojTocnih: brojTocnih, brojNetocnih: brojNetocnih, ukupnoZadataka: player.score.count)
        }

    }
    
    func postDataToFirebase(ime: String, brojTocnih: Int, brojNetocnih: Int, ukupnoZadataka: Int) {
        let myCollection = Firestore.firestore().collection("noviUcenik")
//        let ucenikID = "noviUcenik"
//        let newRef = myCollection.document(ucenikID)
        
        let db = Firestore.firestore()
        
        let data: [String: Any] = [
            "deviceId": UIDevice.current.identifierForVendor!.uuidString,
            "vrijeme": Settings.timeLimit,
            "kofiguracija": "1:\(Settings.brojIgraca)",
            "pocetakAktivnosti": startTimestamp,
            "krajAktivnosti": endTimestamp,
            "imeUcenika": ime,
            "brojTocnih": brojTocnih,
            "brojNetocnih": brojNetocnih,
            "ukupnoZadataka": ukupnoZadataka
        ]
        
//        newRef.setData(data) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added with ID: \(ucenikID)")
//            }
//        }
        
        db.collection("ucenik").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Document added")
            }
        }

    }
    
    // MARK: - Configure Screen
    func configureScreen() {
        if Settings.brojIgraca != 4 {
            mainStackView.removeArrangedSubview(p4View)
            p4View.removeFromSuperview()
            
            if Settings.brojIgraca != 3 {
                mainStackView.removeArrangedSubview(p3View)
                p3View.removeFromSuperview()
                
                if Settings.brojIgraca != 2 {
                    mainStackView.removeArrangedSubview(upperStackView)
                    upperStackView.removeFromSuperview()
                }
            }
        }
    }
    
    // MARK: - Generating tasks
    func generateTaskP1() {
        playerOneTaskTime = 0
        var firstNumber = generateNumber(forOperator: 1)
        var secondNumber = generateNumber(forOperator: 2)
        let operation = operationsArray.randomElement()
        
        var task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"
        
        switch operation {
        case .zbrajanje:
            resultP1 = firstNumber + secondNumber
        case .oduzimanje:
            resultP1 = firstNumber - secondNumber
            if secondNumber > firstNumber {
                task = "\(secondNumber) \(operation!.rawValue) \(firstNumber)"
                resultP1 = secondNumber - firstNumber
            }
        case .mnozenje:
            resultP1 = firstNumber * secondNumber
        case .dijeljenje:
            let (firstNumber, secondNumber) = generateDivisibleNumbers()
            task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"
            resultP1 = firstNumber / secondNumber
        case .none:
            break
        }
        
        p1TaskLabel.text = task
    }
    
    func generateDivisibleNumbers() -> (Int, Int) {
        var firstNumber = Int.random(in: Settings.firstOperatorMin...Settings.firstOperatorMax)
        var secondNumber = Int.random(in: Settings.secondOperatorMin...Settings.secondOperatorMax)
        
        while firstNumber % secondNumber != 0 {
            firstNumber = Int.random(in: Settings.firstOperatorMin...Settings.firstOperatorMax)
            secondNumber = Int.random(in: Settings.secondOperatorMin...Settings.secondOperatorMax)
        }
        
        return (firstNumber, secondNumber)
    }
    
    func generateTaskP2() {
        playerTwoTaskTime = 0
        let firstNumber = generateNumber(forOperator: 1)
        let secondNumber = generateNumber(forOperator: 2)
        let operation = operationsArray.randomElement()
        
        var task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"

        switch operation {
        case .zbrajanje:
            resultP2 = firstNumber + secondNumber
        case .oduzimanje:
            resultP2 = firstNumber - secondNumber
            if secondNumber > firstNumber {
                task = "\(secondNumber) \(operation!.rawValue) \(firstNumber)"
                resultP2 = secondNumber - firstNumber
            }
        case .mnozenje:
            resultP2 = firstNumber * secondNumber
        case .dijeljenje:
            let (firstNumber, secondNumber) = generateDivisibleNumbers()
            task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"
            resultP2 = firstNumber / secondNumber
        case .none:
            break
        }

        p2TaskLabel.text = task
    }
    
    func generateTaskP3() {
        playerThreeTaskTime = 0
        let firstNumber = generateNumber(forOperator: 1)
        let secondNumber = generateNumber(forOperator: 2)
        let operation = operationsArray.randomElement()
        
        var task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"

        switch operation {
        case .zbrajanje:
            resultP3 = firstNumber + secondNumber
        case .oduzimanje:
            resultP3 = firstNumber - secondNumber
            if secondNumber > firstNumber {
                task = "\(secondNumber) \(operation!.rawValue) \(firstNumber)"
                resultP3 = secondNumber - firstNumber
            }
        case .mnozenje:
            resultP3 = firstNumber * secondNumber
        case .dijeljenje:
            let (firstNumber, secondNumber) = generateDivisibleNumbers()
            task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"
            resultP3 = firstNumber / secondNumber
        case .none:
            break
        }

        p3TaskLabel.text = task
    }
    
    func generateTaskP4() {
        playerFourTaskTime = 0
        let firstNumber = generateNumber(forOperator: 1)
        let secondNumber = generateNumber(forOperator: 2)
        let operation = operationsArray.randomElement()
        
        var task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"

        switch operation {
        case .zbrajanje:
            resultP4 = firstNumber + secondNumber
        case .oduzimanje:
            resultP4 = firstNumber - secondNumber
            if secondNumber > firstNumber {
                task = "\(secondNumber) \(operation!.rawValue) \(firstNumber)"
                resultP4 = secondNumber - firstNumber
            }
        case .mnozenje:
            resultP4 = firstNumber * secondNumber
        case .dijeljenje:
            let (firstNumber, secondNumber) = generateDivisibleNumbers()
            task = "\(firstNumber) \(operation!.rawValue) \(secondNumber)"
            resultP4 = firstNumber / secondNumber
        case .none:
            break
        }

        p4TaskLabel.text = task
    }
    
    // MARK: - Generating Numbers
    func generateNumber(forOperator: Int) -> Int {
        if forOperator == 1 {
            return Int.random(in: Settings.firstOperatorMin...Settings.firstOperatorMax)
        }
        if forOperator == 2 {
            return Int.random(in: Settings.secondOperatorMin...Settings.secondOperatorMax)
        } else {
            return 0
        }
    }
    
    // MARK: - ROTATION TODO
    func rotateScreenPlayerOne() {
//        p1TaskLabel.rotate(angle: 270)
//        p1ResultLabel.rotate(angle: 270)
//        keyboardP1.rotate(angle: 270)
        p1View.rotate(angle: 90)
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
        doneButtonP2.addTarget(self, action: #selector(doneButtonPressedP2(sender:)), for: .touchUpInside)
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
        doneButtonP3.addTarget(self, action: #selector(doneButtonPressedP3(sender:)), for: .touchUpInside)
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
        doneButtonP4.addTarget(self, action: #selector(doneButtonPressedP4(sender:)), for: .touchUpInside)
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
        let answer = Int(p1ResultLabel.text ?? "0")
        p1ResultLabel.text = ""
        
        if (answer == resultP1) {
            isP1Correct = true
        } else {
            isP1Correct = false
        }
        
        scoreP1.append(Score(task: p1TaskLabel.text ?? "", answer: answer ?? 0, correctAnswer: resultP1, isCorrect: isP1Correct, time: playerOneTaskTime))
        
        generateTaskP1()
    }
    
    @objc func p2KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p2ResultLabel.text! += value
    }
    
    @objc func deleteP2ButtonAction(sender: UIButton) {
        p2ResultLabel.text = String(p2ResultLabel.text!.dropLast())
    }
    
    @objc func doneButtonPressedP2(sender: UIButton) {
        let answer = Int(p2ResultLabel.text ?? "0")
        p2ResultLabel.text = ""
        
        if (answer == resultP2) {
            isP2Correct = true
        } else {
            isP2Correct = false
        }
        
        scoreP2.append(Score(task: p2TaskLabel.text ?? "", answer: answer ?? 0, correctAnswer: resultP2, isCorrect: isP2Correct, time: playerTwoTaskTime))
        
        generateTaskP2()
    }
    
    @objc func p3KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p3ResultLabel.text! += value
    }
    
    @objc func deleteP3ButtonAction(sender: UIButton) {
        p3ResultLabel.text = String(p3ResultLabel.text!.dropLast())
    }
    
    @objc func doneButtonPressedP3(sender: UIButton) {
        let answer = Int(p3ResultLabel.text ?? "0")
        p3ResultLabel.text = ""
        
        if (answer == resultP3) {
            isP3Correct = true
        } else {
            isP3Correct = false
        }
        
        scoreP3.append(Score(task: p3TaskLabel.text ?? "", answer: answer ?? 0, correctAnswer: resultP3, isCorrect: isP3Correct, time: playerThreeTaskTime))
        
        generateTaskP3()
    }
    
    @objc func p4KeyboardAction(sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        p4ResultLabel.text! += value
    }
    
    @objc func deleteP4ButtonAction(sender: UIButton) {
        p4ResultLabel.text = String(p4ResultLabel.text!.dropLast())
    }
    
    @objc func doneButtonPressedP4(sender: UIButton) {
        let answer = Int(p4ResultLabel.text ?? "0")
        p4ResultLabel.text = ""
        
        if (answer == resultP4) {
            isP4Correct = true
        } else {
            isP4Correct = false
        }
        
        scoreP4.append(Score(task: p4TaskLabel.text ?? "", answer: answer ?? 0, correctAnswer: resultP4, isCorrect: isP4Correct, time: playerFourTaskTime))
        
        generateTaskP4()
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
