//
//  DriverManager.swift
//  Formula One
//
//  Created by MAC OS  on 16.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import UIKit

class DriverManager {
  
  static func getImage(for driver: DriverModel) -> UIImage {
    switch driver.permanentNumber {
    case 44:
      return UIImage(named: "Lewis Hamilton.jpg")!
    case 77:
      return UIImage(named: "Valtteri Bottas.jpg")!
    case 16:
      return UIImage(named: "Charles Leclerc.jpg")!
    case 5:
      return UIImage(named: "Sebastian Vettel.jpg")!
    case 33:
      return UIImage(named: "Max Verstappen.jpg")!
    case 23:
      return UIImage(named: "Alexander Albon.jpg")!
    case 10:
      return UIImage(named: "Pierre Gasly.jpg")!
    case 26:
      return UIImage(named: "Daniil Kvyat.jpg")!
    case 55:
      return UIImage(named: "Carlos Sainz.jpg")!
    case 4:
      return UIImage(named: "Lando Norris.jpg")!
    case 3:
      return UIImage(named: "Daniel Ricciardo.jpg")!
    case 27:
      return UIImage(named: "Nico Hulkenberg.jpg")!
    case 11:
      return UIImage(named: "Sergio Perez.jpg")!
    case 18:
      return UIImage(named: "Lance Stroll.jpg")!
    case 7:
      return UIImage(named: "Kimi Räikkönen.jpg")!
    case 99:
      return UIImage(named: "Antonio Giovinazzi.jpg")!
    case 20:
      return UIImage(named: "Kevin Magnussen.jpg")!
    case 8:
      return UIImage(named: "Romain Grosjean.jpg")!
    case 88:
      return UIImage(named: "Robert Kubica.jpg")!
    case 63:
      return UIImage(named: "George Russell.jpg")!
    default:
      return UIImage(named: "")!
    }
  }
}
