//
//  TrackMainTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 17.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class TrackMainTableViewCell: UITableViewCell {

  @IBOutlet weak var positionTextLabel: UILabel!
  @IBOutlet weak var driverNameTextLabel: UILabel!
  @IBOutlet weak var lapTimeTextLabel: UILabel!
  
//  enum QualifyingType: Int {
//    case q3
//    case q2
//    case q1
//  }
  
  
  func load(with result: QualifyingResultsModel, number: Int) {
    positionTextLabel.text = String(number)
    driverNameTextLabel.text = result.driver.fullName
    lapTimeTextLabel.text = result.q3
    switch number {
    case 0...10:
      print("\(result.q3)")
    case 10...15:
      print("\(result.q2)")
    case 15...20:
      print("\(result.q1)")
    default:
      break
    }
//    switch selectedType {
//    case .q3:
//      print("\(result.q3)")
//    case .q2:
//      print("\(result.q2)")
//    case .q1:
//      print("\(result.q1)")
//    }
  }
}
