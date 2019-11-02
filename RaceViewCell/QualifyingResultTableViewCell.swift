//
//  TrackMainTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 17.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class QualifyingResultTableViewCell: UITableViewCell {
  
  @IBOutlet weak var positionTextLabel: UILabel!
  @IBOutlet weak var driverNameTextLabel: UILabel!
  @IBOutlet weak var lapTimeTextLabel: UILabel!
  
  
  func load(with result: QualifyingResultsModel, number: Int) {
    positionTextLabel.text = String(number)
    driverNameTextLabel.text = result.driver.fullName
    
    let resultQ3 = result.q3
    let resultQ2 = result.q2
    let resultQ1 = result.q1
    
    var resultLaps: String = ""
    
    switch number {
    case 0...10:
      resultLaps = resultQ3
    case 10...15:
      resultLaps = resultQ2
    case 15...20:
      resultLaps = resultQ1
    default:
      break
    }
    
    lapTimeTextLabel.text = resultLaps
  }
}
