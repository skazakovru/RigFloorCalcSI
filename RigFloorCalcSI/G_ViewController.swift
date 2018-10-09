//
//  G_ViewController.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//


import UIKit
import Foundation

class G_ViewController: UIViewController {
    
 
    @IBOutlet weak var casingID: UITextField!
    @IBOutlet weak var casingMD: UITextField!
    @IBOutlet weak var bitOD: UITextField!
    @IBOutlet weak var bitMD: UITextField!
    @IBOutlet weak var drillC1: UITextField!
    @IBOutlet weak var heavyWDP: UITextField!
    @IBOutlet weak var drillPipe: UITextField!
    @IBOutlet weak var drillC1Length: UITextField!
    @IBOutlet weak var heavyWDpLength: UITextField!
    @IBOutlet weak var dpLengthLabel: UILabel!
    @IBOutlet weak var pumpRate: UITextField!
    
    @IBOutlet weak var annularVolumeM3: UILabel!
    @IBOutlet weak var bottomsUpMin: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

 
    @IBAction func calculateButtonTapped(_ sender: Any) {

        
        let num = NumberFormatter()
        let value1 = Double(truncating: num.number(from:casingID.text!)!)
        let value2 = Double(truncating: num.number(from: casingMD.text!)!)
        let value3 = Double(truncating: num.number(from: bitOD.text!)!)
        let value4 = Double(truncating: num.number(from: bitMD.text!)!)
        let value5 = Double(truncating: num.number(from: drillC1.text!)!)
        let value7 = Double(truncating: num.number(from: heavyWDP.text!)!)
        let value8 = Double(truncating: num.number(from: drillPipe.text!)!)
        let value9 = Double(truncating: num.number(from: drillC1Length.text!)!)
        let value11 = Double(truncating: num.number(from:heavyWDpLength.text!)!)
        let value13 = Double(truncating: num.number(from: pumpRate.text!)!)
        
      
            
   
            let dpLength = Double (value4 - (value9 + value11))
            
            let dpVolume = (value5 * value5 * value9 + value7 * value7 * value11 + value8 * value8 * dpLength) * 0.00000494
            
            let annVolume = (((value1 * value1 * value2 + value3 * value3 * (value4 - value2))) * 0.00000494 - dpVolume) * 0.159
            
            annularVolumeM3.text = String (format: "Annular volume %.1f m3", annVolume)
            
            let timeToBU = annVolume / value13
            
            bottomsUpMin.text = String (format: "Bottoms up time %.0f min", timeToBU)
            
        }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
    }


