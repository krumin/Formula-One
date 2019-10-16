//
//  DriverTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 23.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

  @IBOutlet weak var driverNameTextLabel: UILabel!
  @IBOutlet weak var positionDriverTextLabel: UILabel!
  @IBOutlet weak var pointsDriverTextLabel: UILabel!
  @IBOutlet weak var nationalityDriverImageView: UIImageView!
  
  func load(with standing: DriverStandings) {
    let driver = standing.driver
    
    driverNameTextLabel.text = driver.fullName
    positionDriverTextLabel.text = String(standing.position)
    pointsDriverTextLabel.text = String(standing.points)
    nationalityDriverImageView.image = driver.nationalityDriver.flag

  }

}
