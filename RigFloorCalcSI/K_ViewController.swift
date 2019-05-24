//
//  K_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class K_ViewController: UIViewController {
    
    @IBOutlet weak var annCap: UITextField!
    @IBOutlet weak var lightFluidAdded: UITextField!
    @IBOutlet weak var addedFluidWeight: UITextField!
    @IBOutlet weak var originalMudWeight: UITextField!
    @IBOutlet weak var trueVerticalDepth: UITextField!
    @IBOutlet weak var bhpDecrease: UILabel!
    @IBOutlet weak var equivalentMudWeight: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func calculateButtonTapped(_ sender: Any) {
        if annCap.text == "" || lightFluidAdded.text == "" || addedFluidWeight.text == "" || originalMudWeight.text == "" || trueVerticalDepth.text == ""{
            bhpDecrease.text = String("Ooops! Please fill out all cells with valid numbers first.")
        } else {
        
        let num = NumberFormatter()
        var value1 = annCap.text!
        if num.number(from:value1) == nil {
            value1 = value1.replacingOccurrences(of: ".", with: ",")
        }
        var value2 = lightFluidAdded.text!
        if num.number(from:value2) == nil {
            value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        var value3 = addedFluidWeight.text!
        if num.number(from:value3) == nil {
            value3 = value3.replacingOccurrences(of: ".", with: ",")
        }
        var value4 = originalMudWeight.text!
        if num.number(from:value4) == nil {
            value4 = value4.replacingOccurrences(of: ".", with: ",")
        }
        var value5 = trueVerticalDepth.text!
        if num.number(from:value5) == nil {
            value5 = value5.replacingOccurrences(of: ".", with: ",")
        }
        
        let firstValue = Double(truncating: num.number(from: value1)!)
        let secondValue = Double(truncating: num.number(from: value2)!)
        let thirdValue = Double(truncating: num.number(from: value3)!)
        let fourthValue = Double(truncating: num.number(from: value4)!)
        let fifthValue = Double(truncating: num.number(from: value5)!)
        
            
            let outputValue1 = (0.052 * 0.008347 * (fourthValue - thirdValue) * (6.29 * secondValue / (1.9171 * firstValue))) * 0.00689
            
            bhpDecrease.text = String (format: "BHP decreased by: %.3f MPa", outputValue1)
            
            let outputValue2 = (0.008347 * fourthValue - (1454.76 * outputValue1 / fifthValue)) * 119.826
            
            equivalentMudWeight.text = String (format: "EMW at TD: %.0f kg/m3", outputValue2)
            
        }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
}

