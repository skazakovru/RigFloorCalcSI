//
//  H_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

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
        
        
        let num = NumberFormatter()
        num.locale = Locale.current
        let firstValue = Double(num.number(from:shoeTVD.text!)!)
        let secondValue = Double(num.number(from: mudWeight.text!)!)
        let thirdValue = Double(num.number(from: tagetFIT.text!)!)
        
        let outputValue = 0.000009817 * firstValue * (thirdValue - secondValue)
        
        outputPressureApply.text = String (format: "Surface pressure to apply: %.2f MPa", outputValue)
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
}

