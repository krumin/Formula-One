//
//  RaceTrackTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 22.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class RaceTrackTableViewCell: UITableViewCell {
  
  @IBOutlet weak var raceNameTextLabel: UILabel!
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var raceNumberTextLabel: UILabel!
  @IBOutlet weak var countryImage: UIImageView!
  @IBOutlet weak var raceDateTextLabel: UILabel!
  
  func loadData(with tracks:RaceTrackModel) {
    raceNameTextLabel.text = tracks.raceName
    raceNumberTextLabel.text = String(tracks.round)
    view.layer.cornerRadius = 15
    view.layer.borderWidth = 2
    countryImage.image = tracks.country.flag
    raceDateTextLabel.text = tracks.date
  }
}




