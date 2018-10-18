//
//  F_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class F_ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mudVolumeTextField: UITextField!
    @IBOutlet weak var pressureAppliedTextField: UITextField!
    var resultLable : Double = 0.0000045
    @IBOutlet weak var ouputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            resultLable = 0.0000045
        case 1:
            resultLable = 0.0000030
            
        default:
            break
        }
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        
        let num = NumberFormatter()
        var value1 = mudVolumeTextField.text!
        if num.number(from:value1) == nil {
            value1 = value1.replacingOccurrences(of: ".", with: ",")
        }
        var value2 = pressureAppliedTextField.text!
        if num.number(from:value2) == nil {
            value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        let firstValue = Double(truncating: num.number(from: value1)!)
        let secondValue = Double(truncating: num.number(from: value2)!)
        
        let outPut = Double (6.29 * firstValue * 145 * secondValue * resultLable) * 0.159
            
        ouputLabel.text = String (format: " Mud needed to pressure Up: %.2f m3", outPut)
    }
}


