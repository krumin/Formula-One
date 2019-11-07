//
//  NewsLinksTableViewCell.swift
//  Formula One
//
//  Created by MAC OS  on 07.11.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class NewsLinksTableViewCell: UITableViewCell {

  @IBOutlet weak var webNameTextLabel: UILabel!
  
  func loadData(with links:SportsLinks) {
  webNameTextLabel.text = links.name
  
  }
}
