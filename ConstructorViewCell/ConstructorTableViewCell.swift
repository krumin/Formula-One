//
//  ConstructorTableViewCell.swift
//  
//
//  Created by MAC OS  on 08.10.2019.
//

import UIKit

class ConstructorTableViewCell: UITableViewCell {
  
  @IBOutlet weak var positionTextLabel: UILabel!
  @IBOutlet weak var constructorsTextLabel: UILabel!
  @IBOutlet weak var pointsTextLabel: UILabel!
  @IBOutlet weak var nationalityConstructorImageView: UIImageView!
  
  let standing: ConstructorStandings? = nil
  
  func load(with standing:ConstructorStandings) {
    let constructor = standing.constructor
    
    positionTextLabel.text = String(standing.position)
    constructorsTextLabel.text = constructor.name
    pointsTextLabel.text = String(standing.points)
    nationalityConstructorImageView.image = constructor.nationalityConstructor.flag
  }
}
