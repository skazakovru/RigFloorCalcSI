//
//  D_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

class D_ViewController: UIViewController {
    

    @IBOutlet weak var pipeIDTextField: UITextField!
    
    @IBOutlet weak var weightTJTextField: UITextField!

    @IBOutlet weak var lengthTextField: UITextField!
    
    @IBOutlet weak var openEndTextField: UILabel!

    @IBOutlet weak var closeEndTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calcButtonTapped(_ sender: Any) {

        let numFor = NumberFormatter()
        let firstValue = Double(truncating: numFor.number (from: pipeIDTextField.text!)!)
        let secondValue = Double(truncating: numFor.number(from: weightTJTextField.text!)!)
        let thirdValue = Double(truncating: numFor.number(from: lengthTextField.text!)!)
        
            
        let calculatedValue = (0.672 * secondValue * 0.0003638 * thirdValue * 3.281)
        
        let calculatedValue1 = calculatedValue * 0.159
            
        let calculatedValue2 = ((0.00155 * firstValue * firstValue * 0.0009714 * thirdValue * 3.281) + calculatedValue) * 0.159
            
        openEndTextField.text = String (format: "Open end pipe per Length: %.3f m3", calculatedValue1)
        closeEndTextField.text = String (format: "Closed end pipe per Length: %.3f m3", calculatedValue2)
        
        }
        
    }
    


