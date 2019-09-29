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
  @IBOutlet weak var teamDriverTextLabel: UILabel!
  @IBOutlet weak var pointsDriverTextLabel: UILabel!
  
  func load(with drivers:DriverStandings) {
    driverNameTextLabel.text = drivers.driver.givenName + " " + drivers.driver.familyName
    positionDriverTextLabel.text = String(drivers.position)
    teamDriverTextLabel.text = drivers.constructors.name

//    view.layer.cornerRadius = 15
//    view.layer.borderWidth = 2
  }

}
