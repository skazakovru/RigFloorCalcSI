//
//  J_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class J_ViewController: UIViewController {
    

    @IBOutlet weak var drillpipeWeight: UITextField!

    @IBOutlet weak var pipeStretch: UITextField!
 
    @IBOutlet weak var pipeOverpull: UITextField!
    
 
    @IBOutlet weak var depthStuck: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func calculateBtnTapped(_ sender: Any) {
    
        
        let num = NumberFormatter()
        let firstValue = Double(truncating: num.number(from:drillpipeWeight.text!)!)
        let secondValue = Double(truncating: num.number(from: pipeStretch.text!)!)
        let thirdValue = Double(truncating: num.number(from: pipeOverpull.text!)!)
        
        
        let calculatedValue = 26.89 * secondValue * firstValue / thirdValue
    
        
        depthStuck.text = String (format: "Estimated stuck point: %.0f meters", calculatedValue)
    }
}

