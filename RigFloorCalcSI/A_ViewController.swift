//
//  A_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//

import UIKit

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
    
        let num = NumberFormatter()
        let firstValue = Double(num.number(from:originalMWTextField.text!)!)
        let secondValue = Double(num.number(from: shutIDPPtextField.text!)!)
        let thirdValue = Double(num.number(from: trueVDtextField.text!)!)

            
    
    let outputValue = Double(((secondValue * 145.038 * 19.23)/(thirdValue * 3.281) + firstValue * 0.008347245) * 119.826)
            
            outputLabel.text = String(format:"Kill weight mud: %.0f kg/m3", outputValue)
        }

    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
    }
    


