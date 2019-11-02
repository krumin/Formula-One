//
//  RaceBeginningTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 31.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class RaceBeginningTableViewCell: UITableViewCell {
  
  @IBOutlet weak var raceName: UILabel!
  @IBOutlet weak var flagImageView: UIImageView!
  
  func loadData(with tracks:RaceTrackModel) {
    let flag = tracks.country.flag
    raceName.text = tracks.raceName
    flagImageView.image = flag
  }
}
