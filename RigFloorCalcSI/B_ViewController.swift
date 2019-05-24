//
//  B_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class B_ViewController: UIViewController {
    

    
    @IBOutlet weak var slugVolumeTextField: UITextField!
    @IBOutlet weak var slWeightTextField: UITextField!
    @IBOutlet weak var mudWeightTextField: UITextField!
    
    @IBOutlet weak var outputTextLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateTapped(_ sender: Any) {
        if slugVolumeTextField.text == "" || slWeightTextField.text == "" || mudWeightTextField.text == "" {
            outputTextLabel.text = String("Nice try! Please fill out all cells with real numbers first.")
        } else {
        
        var firstValue = Double(slugVolumeTextField.text!)
        var secondValue = Double(slWeightTextField.text!)
        var thirdValue = Double(mudWeightTextField.text!)
        
        let num = NumberFormatter()
        print(num.locale!)
        var value1 = slugVolumeTextField.text!
        if num.number(from:value1) == nil {
            value1 = value1.replacingOccurrences(of: ".", with: ",")
        }
            
        firstValue = Double(truncating: num.number(from: value1)!)
        secondValue = Double(truncating: num.number(from: slWeightTextField.text!)!)
        thirdValue = Double(truncating: num.number(from: mudWeightTextField.text!)!)
        
        if firstValue != nil && secondValue != nil && thirdValue != nil {
            let outputValue = Double(0.159 * (6.29 * firstValue! * (0.0083454 * secondValue! - 0.0083454 * thirdValue!)/(0.0083454 * thirdValue!)))
            
            outputTextLabel.text = String(format:"Pit Gain: %.2f m3", outputValue)
        
        }
    }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }

}

