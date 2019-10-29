//
//  TrackInfoTableViewCell.swift
//  
//
//  Created by MAC OS  on 17.10.2019.
//

import UIKit

class TrackInfoTableViewCell: UITableViewCell {

  @IBOutlet weak var positionTextLabel: UILabel!
  @IBOutlet weak var gridPositionTextLabel: UILabel!
  @IBOutlet weak var driverNameTextLabel: UILabel!
  @IBOutlet weak var raceTimeTextLabel: UILabel!
  
  func load(with result: RaceResultsModel, number: Int) {
    positionTextLabel.text = String(number)
    gridPositionTextLabel.text = String(result.grid)
    driverNameTextLabel.text = result.driver.fullName
    raceTimeTextLabel.text = result.resultTime
  }
}
