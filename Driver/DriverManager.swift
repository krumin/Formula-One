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
  
  static func getImageDriver(for driver: DriverModel) -> UIImage? {
    switch driver.permanentNumber {
    case 44:
      return UIImage(named: "Drivers/Lewis Hamilton.png")
    case 77:
      return UIImage(named: "Drivers/Valtteri Bottas.jpg")
    case 16:
      return UIImage(named: "Drivers/Charles Leclerc.jpg")
    case 5:
      return UIImage(named: "Drivers/Sebastian Vettel.jpg")
    case 33:
      return UIImage(named: "Drivers/Max Verstappen.jpg")
    case 23:
      return UIImage(named: "Drivers/Alexander Albon.jpg")
    case 10:
      return UIImage(named: "Drivers/Pierre Gasly.jpg")
    case 26:
      return UIImage(named: "Drivers/Daniil Kvyat.jpg")
    case 55:
      return UIImage(named: "Drivers/Carlos Sainz.jpg")
    case 4:
      return UIImage(named: "Drivers/Lando Norris.jpg")
    case 3:
      return UIImage(named: "Drivers/Daniel Ricciardo.jpg")
    case 27:
      return UIImage(named: "Drivers/Nico Hulkenberg.jpg")
    case 11:
      return UIImage(named: "Drivers/Sergio Perez.jpg")
    case 18:
      return UIImage(named: "Drivers/Lance Stroll.jpg")
    case 7:
      return UIImage(named: "Drivers/Kimi Räikkönen.jpg")
    case 99:
      return UIImage(named: "Drivers/Antonio Giovinazzi.jpg")
    case 20:
      return UIImage(named: "Drivers/Kevin Magnussen.jpg")
    case 8:
      return UIImage(named: "Drivers/Romain Grosjean.jpg")
    case 88:
      return UIImage(named: "Drivers/Robert Kubica.jpg")
    case 63:
      return UIImage(named: "Drivers/George Russell.jpg")
    default:
      return UIImage(named: "Drivers/Unknow.png")
    }
  }
}
