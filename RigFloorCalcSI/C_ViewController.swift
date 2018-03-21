//
//  C_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

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
        
        let numberFormatter = NumberFormatter()
        firstValue = Double(truncating: numberFormatter.number(from: drillPipeID.text!)!)
        secondValue = Double(truncating: numberFormatter.number(from: slugVolume.text!)!)
        thirdValue = Double(truncating: numberFormatter.number(from: slugWeight.text!)!)
        fourthValue = Double(truncating: numberFormatter.number(from: mudWeight.text!)!)
        
        if firstValue != nil && secondValue != nil && thirdValue != nil && fourthValue != nil {
            
            let outputValue1 = Double((1029.4 * secondValue! * 6.29)/(0.0393701 * 0.039701 * firstValue! * firstValue!) * ((thirdValue!/fourthValue!) - 1))
            
            let outputValue2 = Double((outputValue1) / 3.281)
            
            metersDropLevel.text = String (format: "Fluid level at %.1f m", outputValue2)
        }
    }
    
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }

}

