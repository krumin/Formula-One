//
//  TeamLabel.swift
//  Formula One
//
//  Created by MAC OS  on 21.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import UIKit

enum Car: String {
  case mersedes = "mercedes"
  case ferrari = "ferrari"
  case alfa = "alfa"
  case toroRosso = "toro_rosso"
  case haas = "haas"
  case racingPoint = "racing_point"
  case mclaren = "mclaren"
  case redBull = "red_bull"
  case renault = "renault"
  case williams = "williams"
  case unknow = "unknow"
  
  var carImage: UIImage? {
    switch self {
    case .mersedes:
      return UIImage(named: "Cars/Mercedes.png")
    case .ferrari:
      return UIImage(named: "Cars/Ferrari.png")
    case .alfa:
      return UIImage(named: "Cars/AlfaRomeo.png")
    case .toroRosso:
      return UIImage(named: "Cars/ToroRosso.png")
    case .haas:
      return UIImage(named: "Cars/Haas.png")
    case .racingPoint:
      return UIImage(named: "Cars/RacingPoint.png")
    case .mclaren:
      return UIImage(named: "Cars/McLaren.png")
    case .redBull:
      return UIImage(named: "Cars/RedBull.png")
    case .renault:
      return UIImage(named: "Cars/Renault.png")
    case .williams:
      return UIImage(named: "Cars/Williams.png")
    case .unknow:
      return UIImage(named: "Cars/Unknow.png")
    }
  }
}
