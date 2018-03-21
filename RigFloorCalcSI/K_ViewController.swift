//
//  K_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

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

        
        let num = NumberFormatter()
        let firstValue = Double(truncating: num.number(from:annCap.text!)!)
        let secondValue = Double(truncating: num.number(from:lightFluidAdded.text!)!)
        let thirdValue = Double(truncating: num.number(from: addedFluidWeight.text!)!)
        let fourthValue = Double(truncating: num.number(from: originalMudWeight.text!)!)
        let fifthValue = Double(truncating: num.number(from: trueVerticalDepth.text!)!)
        
            
            let outputValue1 = (0.052 * 0.008347 * (fourthValue - thirdValue) * (6.29 * secondValue / (1.9171 * firstValue))) * 0.00689
            
            bhpDecrease.text = String (format: "BHP decreased by: %.3f MPa", outputValue1)
            
            let outputValue2 = (0.008347 * fourthValue - (1454.76 * outputValue1 / fifthValue)) * 119.826
            
            equivalentMudWeight.text = String (format: "EMW at TD: %.0f kg/m3", outputValue2)
            
        }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
}

