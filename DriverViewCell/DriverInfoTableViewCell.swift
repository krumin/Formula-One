//
//  DriverInfoTableViewCellTwo.swift
//  
//
//  Created by MAC OS  on 16.10.2019.
//

import UIKit
import SafariServices

class DriverInfoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var permanentNumberTextLabel: UILabel!
  @IBOutlet weak var codeTextLabel: UILabel!
  @IBOutlet weak var nationalityTextLabel: UILabel!
  @IBOutlet weak var dateOfBirthTextLabel: UILabel!
  @IBOutlet weak var teamTextLabel: UILabel!
  @IBOutlet weak var nationalityDriverImageView: UIImageView!
  @IBOutlet weak var nationalityTeamImageView: UIImageView!
  @IBOutlet weak var constructorIdImageView: UIImageView!
  
  func loadData(with driverStanding: DriverStandings) {
    let driver = driverStanding.driver
    let constructors = allNamesConstructors(constructors: driverStanding.constructors)
    
    permanentNumberTextLabel.text = String(driver.permanentNumber)
    codeTextLabel.text = "Code Name: \(driver.code)"
    nationalityTextLabel.text = "Country: \(driver.nationalityDriver.rawValue)"
    dateOfBirthTextLabel.text = "Born: \(driver.dateOfBirth)"
    teamTextLabel.text = "Team: \(constructors)"
    nationalityDriverImageView.image = driver.nationalityDriver.flag
    nationalityTeamImageView.image = driverStanding.constructors.first!.nationalityConstructor.flag
    constructorIdImageView.image = driverStanding.constructors.first!.constructorId.carImage
  }
  
  func allNamesConstructors(constructors: [ConstructorModel]) -> String {
    var constructorsNames = ""
    for (index, constructor) in constructors.enumerated() {
      if index == 0 {
        constructorsNames.append(constructor.name)
      } else {
        constructorsNames.append(",")
        constructorsNames.append(constructor.name)
      }
    }
    return constructorsNames
  }
}
