//
//  TrackDetailTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 29.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class RaceFastLapTableViewCell: UITableViewCell {
  
  @IBOutlet weak var fastedLapTextLabel: UILabel!
  @IBOutlet weak var driverNameTextLabel: UILabel!
  @IBOutlet weak var lapTextLabel: UILabel!
  @IBOutlet weak var timeTextLabel: UILabel!
  
  func loadData(with result: RaceResultsModel) {
    driverNameTextLabel.text = result.driver.fullName
    lapTextLabel.text = "Lap :\(String(result.lap)),"
    timeTextLabel.text = result.fastTimeLap
  }
}
