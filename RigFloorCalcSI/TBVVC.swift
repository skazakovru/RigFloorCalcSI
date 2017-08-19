//
//  TBVVC.swift
//  RigFloorCalcSI
//
//  Created by Sergei Kazakov on 17/08/2017.
//  Copyright © 2017 Sergei Kazakov. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var names = [String]()
    var identities = [String]()
    
    override func viewDidLoad() {
        names = ["Kill Weight Mud","Pit Gain From Slug","Level Drop After Slug Pumped","Pipe Displacement","Triplex Pump Output","Mud Compression","Bottoms Up Time","Pressure Applied for FIT", "OH Diameter From Lag Time", "Estimated Stuck Point","BHP Decrease if Returns Lost", "*** Abbreviations"]
        identities = ["A","B","C","D","E","F","G","H","I","J","K","L"]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
