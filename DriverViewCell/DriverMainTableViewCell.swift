//
//  DriverInfoTableViewCellOne.swift
//  Formula One
//
//  Created by MAC OS  on 16.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class DriverMainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var driverNameTextLabel: UILabel!
  
  func load(with standing: DriverStandings) {
    let driver = standing.driver
    driverNameTextLabel.text = driver.fullName
  }
}
