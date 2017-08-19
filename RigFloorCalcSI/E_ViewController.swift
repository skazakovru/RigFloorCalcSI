//
//  E_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

class E_ViewController: UIViewController {
    
    @IBOutlet weak var triplexLinerId: UITextField!
    @IBOutlet weak var stroleLengthTextfield: UITextField!
    @IBOutlet weak var efficiencyTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {

        let num = NumberFormatter()
        let firstValue = Double(num.number(from: triplexLinerId.text!)!)
        let secondValue = Double(num.number(from: stroleLengthTextfield.text!)!)
        let thirdValue = Double(num.number(from: efficiencyTextField.text!)!)
        
        let outputValue1 = Double (0.0002428 * 0.00155 * firstValue * firstValue * 0.03937 * secondValue * thirdValue / 100)
        
        let outputValue2 = outputValue1 * 158.98
        
        outputLabel.text = String (format: "Pump output: %.3f liters/stk", outputValue2)
        
    }
    
}

