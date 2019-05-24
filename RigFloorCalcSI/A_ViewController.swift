//
//  A_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//

import UIKit
import Foundation

class A_ViewController: UIViewController {
    
    
    @IBOutlet weak var originalMWTextField: UITextField!
    @IBOutlet weak var shutIDPPtextField: UITextField!
    @IBOutlet weak var trueVDtextField: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonTapped(_ sender: Any) {
        if originalMWTextField.text == "" || shutIDPPtextField.text == "" || trueVDtextField.text == "" {
            outputLabel.text = String("Nice try! Please fill out all cells with real numbers.")
        } else {
        
        let num = NumberFormatter()
        print(num.locale!)     // to test locale on iPhone
        var value2 = shutIDPPtextField.text!
        if num.number(from:value2) == nil {
            value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        var value3 = trueVDtextField.text!
        if num.number(from:value3) == nil {
            value3 = value3.replacingOccurrences(of: ".", with: ",")
        }
        let firstValue = Double(truncating: num.number(from:originalMWTextField.text!)!)
        let secondValue = Double(truncating: num.number(from: value2)!)
        let thirdValue = Double(truncating: num.number(from: value3)!)

            
    
    let outputValue = Double(((secondValue * 145.038 * 19.23)/(thirdValue * 3.281) + firstValue * 0.008347245) * 119.826)
            
            outputLabel.text = String(format:"Kill weight mud: %.0f kg/m3", outputValue)
        }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
    }
    


