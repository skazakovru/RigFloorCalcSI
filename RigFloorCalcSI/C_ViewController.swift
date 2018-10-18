//
//  C_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class C_ViewController: UIViewController {
    

    @IBOutlet weak var drillPipeID: UITextField!
    @IBOutlet weak var slugVolume: UITextField!
    @IBOutlet weak var slugWeight: UITextField!
    @IBOutlet weak var mudWeight: UITextField!
    @IBOutlet weak var metersDropLevel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {

        var firstValue = Double(drillPipeID.text!)
        var secondValue = Double(slugVolume.text!)
        var thirdValue = Double(slugWeight.text!)
        var fourthValue = Double(mudWeight.text!)
        
        let num = NumberFormatter()
        
        var value1 = drillPipeID.text!
        var value2 = slugVolume.text!
        var value3 = slugWeight.text!
        var value4 = mudWeight.text!
        
        if num.number(from:value1) == nil {
            value1 = value1.replacingOccurrences(of: ".", with: ",")
        }
        if num.number(from: value2) == nil {
             value2 = value2.replacingOccurrences(of: ".", with: ",")
        }
        if num.number(from: value3) == nil {
            value3 = value3.replacingOccurrences(of: ".", with: ",")
        }
        if num.number(from: value4) == nil {
            value4 = value4.replacingOccurrences(of: ".", with: ",")
        }
        
        firstValue = Double(truncating: num.number(from: value1)!)
        secondValue = Double(truncating: num.number(from: value2)!)
        thirdValue = Double(truncating: num.number(from: value3)!)
        fourthValue = Double(truncating: num.number(from: value4)!)
        
        if firstValue != nil && secondValue != nil && thirdValue != nil && fourthValue != nil {
            
            let outputValue1 = Double((1029.4 * secondValue! * 6.29)/(0.0393701 * 0.039701 * firstValue! * firstValue!) * ((thirdValue!/fourthValue!) - 1))
            
            let outputValue2 = Double((outputValue1) / 3.281)
            
            metersDropLevel.text = String (format: "Fluid level at %.1f m", outputValue2)
        }
    }
    
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }

}

