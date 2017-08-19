//
//  B_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

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
        
        var firstValue = Double(slugVolumeTextField.text!)
        var secondValue = Double(slWeightTextField.text!)
        var thirdValue = Double(mudWeightTextField.text!)
        
        let numberFormatter = NumberFormatter()
        firstValue = Double(numberFormatter.number(from: slugVolumeTextField.text!)!)
        secondValue = Double(numberFormatter.number(from: slWeightTextField.text!)!)
        thirdValue = Double(numberFormatter.number(from: mudWeightTextField.text!)!)
        
        if firstValue != nil && secondValue != nil && thirdValue != nil {
            let outputValue = Double(0.159 * (6.29 * firstValue! * (0.0083454 * secondValue! - 0.0083454 * thirdValue!)/(0.0083454 * thirdValue!)))
            
            outputTextLabel.text = String(format:"Pit Gain: %.2f m3", outputValue)
        
        }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }

}

