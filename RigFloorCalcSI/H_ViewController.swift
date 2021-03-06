//
//  H_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class H_ViewController: UIViewController {
    
    
    @IBOutlet weak var shoeTVD: UITextField!
 
    @IBOutlet weak var mudWeight: UITextField!
    @IBOutlet weak var tagetFIT: UITextField!
    
    @IBOutlet weak var outputPressureApply: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateTapped(_ sender: Any) {
        if shoeTVD.text == "" || mudWeight.text == "" || tagetFIT.text == "" {
            outputPressureApply.text = String("Nice try! Please fill out all cells with real numbers first.")
        } else {
        
        let num = NumberFormatter()
        var value1 = shoeTVD.text!
        if num.number(from:value1) == nil {
            value1 = value1.replacingOccurrences(of: ".", with: ",")
        }
        var value2 = mudWeight.text!
        if num.number(from:value2) == nil {
            value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        var value3 = tagetFIT.text!
        if num.number(from:value3) == nil {
            value3 = value3.replacingOccurrences(of: ".", with: ",")
        }
        let firstValue = Double(truncating: num.number(from: value1)!)
        let secondValue = Double(truncating: num.number(from: value2)!)
        let thirdValue = Double(truncating: num.number(from: value3)!)
        
        let outputValue = 0.000009817 * firstValue * (thirdValue - secondValue)
        
        outputPressureApply.text = String (format: "Surface pressure to apply: %.2f MPa", outputValue)
    }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
}

