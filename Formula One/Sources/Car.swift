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
  
//  var urlConstructor: URL? {
//    switch self {
//    case .mersedes:
//      return URL(string: "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One")
//    case .ferrari:
//      return URL(string: "http://en.wikipedia.org/wiki/Scuderia_Ferrari")
//    case .alfa:
//      return URL(string: "http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One")
//    case .toroRosso:
//      return URL(string: "http://en.wikipedia.org/wiki/Scuderia_Toro_Rosso")
//    case .haas:
//      return URL(string: "http://en.wikipedia.org/wiki/Haas_F1_Team")
//    case .racingPoint:
//      return URL(string: "http://en.wikipedia.org/wiki/Racing_Point_F1_Team")
//    case .mclaren:
//      return URL(string: "http://en.wikipedia.org/wiki/McLaren")
//    case .redBull:
//      return URL(string: "http://en.wikipedia.org/wiki/Red_Bull_Racing")
//    case .renault:
//      return URL(string: "http://en.wikipedia.org/wiki/Renault_in_Formula_One")
//    case .williams:
//      return URL(string: "http://en.wikipedia.org/wiki/Williams_Grand_Prix_Engineering")
//    case .unknow:
//      return URL(string: "https://www.google.com")
//    }
//  }
}
