//
//  E_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation


class E_ViewController: UIViewController {


    @IBOutlet weak var linerDiam: UITextField!
    @IBOutlet weak var strokeLength: UITextField!
    @IBOutlet weak var pumpEfficiency: UITextField!
    @IBOutlet weak var outputLiters: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func caculateBtnTapped(_ sender: Any) {
        if linerDiam.text == "" || strokeLength.text == "" || pumpEfficiency.text == "" {
            outputLiters.text = String("Nice try! Please fill out all cells with real numbers first.")
        } else {
        let num = NumberFormatter()
        var value = linerDiam.text!
        var value2 = strokeLength.text!
        if num.number(from:value) == nil {
            value = value.replacingOccurrences(of: ".", with: ",")
        }
        if num.number(from:value2) == nil {
            value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        let firstValue = Double(truncating: num.number(from: value)!)
        let secondValue = Double(truncating: num.number(from: value2)!)
        let thirdValue = Double(truncating: num.number(from: pumpEfficiency.text!)!)
        
        let outputValue1 = Double (0.000000015 * firstValue * firstValue *  secondValue * thirdValue / 100)
        
        
        let outputValue2 = outputValue1 * 158.99
        
        outputLiters.text = String (format: "%.1f liters/stk", outputValue2)
        
    }
    }

    @IBAction func gestureTapped(_ sender: Any) {view.endEditing(true)
    }
    
}



    

