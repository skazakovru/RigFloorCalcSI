//
//  I_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit

class I_ViewController: UIViewController {
    

    @IBOutlet weak var measuredLagTime: UITextField!
    @IBOutlet weak var annularVolume: UITextField!
    @IBOutlet weak var bitSize: UITextField!
    @IBOutlet weak var pumpOutput: UITextField!
    @IBOutlet weak var openHoleLength: UITextField!

    @IBOutlet weak var outputTextLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculateTapped(_ sender: Any) {
        
        let num = NumberFormatter()
        let firstValue = Double(num.number(from:measuredLagTime.text!)!)
        let secondValue = Double(num.number(from:annularVolume.text!)!)
        let thirdValue = Double(num.number(from: bitSize.text!)!)
        let fourthValue = Double(num.number(from: pumpOutput.text!)!)
        let fifthValue = Double(num.number(from: openHoleLength.text!)!)
        
            
            let outputValue = (sqrt((firstValue - secondValue / fourthValue) * 6.29 * fourthValue * 1029.4 / (fifthValue * 3.281) + thirdValue * thirdValue * 0.00155)) * 25.4
            
            outputTextLabel.text = String (format: "Average OH diameter: %.2f mm", outputValue)
        }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
    }   

