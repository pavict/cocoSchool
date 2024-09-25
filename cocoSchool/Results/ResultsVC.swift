//
//  ResultsVC.swift
//  cocoSchool
//
//  Created by Toni Pavic on 18.04.2023..
//

import Foundation
import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var p1DoneButton: UIButton!
    @IBOutlet weak var p2DoneButton: UIButton!
    @IBOutlet weak var p3DoneButton: UIButton!
    @IBOutlet weak var p4DoneButton: UIButton!
    
    @IBOutlet weak var upperStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var p2View: UIView!
    @IBOutlet weak var p3View: UIView!
    @IBOutlet weak var p4View: UIView!
    
    @IBOutlet weak var p1ResultsTable: UITableView!
    @IBOutlet weak var p2ResultsTable: UITableView!
    @IBOutlet weak var p3ResultsTable: UITableView!
    @IBOutlet weak var p4ResultsTable: UITableView!
    
    var p1Results = [Score]()
    var p2Results = [Score]()
    var p3Results = [Score]()
    var p4Results = [Score]()
    
    var p1Done = false
    var p2Done = false
    var p3Done = false
    var p4Done = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Settings.brojIgraca == 2 {
            rotateView(contentView, byAngle: CGFloat.pi/2) // Rotate by 45 degrees
        }
        
        p2View.rotate(angle: 180)
        p3View.rotate(angle: 180)
        
        configureScreen()
    }
    
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
    
    func rotateView(_ view: UIView, byAngle angle: CGFloat) {
        view.layer.removeAllAnimations() // Remove any previous animations
        
        UIView.animate(withDuration: 0.3) {
            let rotationTransform = CGAffineTransform(rotationAngle: angle)
            view.transform = rotationTransform
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case p1ResultsTable:
            return p1Results.count
        case p2ResultsTable:
            return p2Results.count
        case p3ResultsTable:
            return p3Results.count
        case p4ResultsTable:
            return p4Results.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsTableViewCell", for: indexPath) as! ResultsTableViewCell
        
        switch tableView {
        case p1ResultsTable:
            let result = p1Results[indexPath.row]
            cell.setCell(task: result, row: indexPath.row + 1)
        case p2ResultsTable:
            let result = p2Results[indexPath.row]
            cell.setCell(task: result, row: indexPath.row + 1)
        case p3ResultsTable:
            let result = p3Results[indexPath.row]
            cell.setCell(task: result, row: indexPath.row + 1)
        case p4ResultsTable:
            let result = p4Results[indexPath.row]
            cell.setCell(task: result, row: indexPath.row + 1)
        default:
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    @IBAction func p1FinishedButtonPressed(_ sender: Any) {
        p1Done = true
        if let image = UIImage(named: "checkedYellow.png") {
            p1DoneButton.setImage(image, for: .normal)
        }
        
        returnToFirstScreen()
    }
    @IBAction func p2FinishedButtonPressed(_ sender: Any) {
        p2Done = true
        if let image = UIImage(named: "checkedBlue.png") {
            p2DoneButton.setImage(image, for: .normal)
        }
        
        returnToFirstScreen()
    }
    @IBAction func p3FinishedButtonPressed(_ sender: Any) {
        p3Done = true
        if let image = UIImage(named: "checkedPink.png") {
            p3DoneButton.setImage(image, for: .normal)
        }
        
        returnToFirstScreen()
    }
    @IBAction func p4FinishedButtonPressed(_ sender: Any) {
        p4Done = true
        if let image = UIImage(named: "checkedGreen.png") {
            p4DoneButton.setImage(image, for: .normal)
        }
        
        returnToFirstScreen()
    }
    
    func returnToFirstScreen() {
        var isEveryoneDone = false
        
        switch Settings.brojIgraca {
        case 1:
            isEveryoneDone = p1Done
        case 2:
            isEveryoneDone = p1Done && p2Done
        case 3:
            isEveryoneDone = p1Done && p2Done && p3Done
        case 4:
            isEveryoneDone = p1Done && p2Done && p3Done && p4Done
        default:
            break
        }
        
        if (isEveryoneDone) {
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                window.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
