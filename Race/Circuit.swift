//
//  Circuit.swift
//  Formula One
//
//  Created by MAC OS  on 09.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import UIKit

enum Circuit: String {
  case australianGrandPrix = "Albert Park Grand Prix Circuit"
  case bahrainGrandPrix = "Bahrain International Circuit"
  case chineseGrandPrix = "Shanghai International Circuit"
  case azerbaijanGrandPrix = "Baku City Circuit"
  case spanishGrandPrix = "Circuit de Barcelona-Catalunya"
  case monacoGrandPrix = "Circuit de Monaco"
  case canadianGrandPrix = "Circuit Gilles Villeneuve"
  case frenchGrandPrix = "Circuit Paul Ricard"
  case austrianGrandPrix = "Red Bull Ring"
  case britishGrandPrix = "Silverstone Circuit"
  case germanGrandPrix = "Hockenheimring"
  case hungarianGrandPrix = "Hungaroring"
  case belgianGrandPrix = "Circuit de Spa-Francorchamps"
  case italianGrandPrix = "Autodromo Nazionale di Monza"
  case singaporeGrandPrix = "Marina Bay Street Circuit"
  case russianGrandPrix = "Sochi Autodrom"
  case japaneseGrandPrix = "Suzuka Circuit"
  case mexicanGrandPrix = "Autódromo Hermanos Rodríguez"
  case unitedStatesGrandPrix = "Circuit of the Americas"
  case brazilianGrandPrix = "Autódromo José Carlos Pace"
  case abuDhabiGrandPrix = "Yas Marina Circuit"
  case unknow = "Unknow"
  
  var image: UIImage? {
    switch self {
    case .australianGrandPrix:
      return UIImage(named: "Circuits/Albert Park Grand Prix Circuit.png")
    case .bahrainGrandPrix:
      return UIImage(named: "Circuits/Bahrain International Circuit.png")
    case .chineseGrandPrix:
      return UIImage(named: "Circuits/Shanghai International Circuit.png")
    case .azerbaijanGrandPrix:
      return UIImage(named: "Circuits/Baku City Circuit.png")
    case .spanishGrandPrix:
      return UIImage(named: "Circuits/Circuit de Barcelona-Catalunya.png")
    case .monacoGrandPrix:
      return UIImage(named: "Circuits/Circuit de Monaco.png")
    case .canadianGrandPrix:
      return UIImage(named: "Circuits/Circuit Gilles Villeneuve.png")
    case .frenchGrandPrix:
      return UIImage(named: "Circuits/Circuit Paul Ricard.png")
    case .austrianGrandPrix:
      return UIImage(named: "Circuits/Red Bull Ring.png")
    case .britishGrandPrix:
      return UIImage(named: "Circuits/Silverstone Circuit.png")
    case .germanGrandPrix:
      return UIImage(named: "Circuits/Hockenheimring.png")
    case .hungarianGrandPrix:
      return UIImage(named: "Circuits/Hungaroring.png")
    case .belgianGrandPrix:
      return UIImage(named: "Circuits/Circuit de Spa-Francorchamps.png")
    case .italianGrandPrix:
      return UIImage(named: "Circuits/Autodromo Nazionale di Monza.png")
    case .singaporeGrandPrix:
      return UIImage(named: "Circuits/Marina Bay.png")
    case .russianGrandPrix:
      return UIImage(named: "Circuits/Sochi Autodrom.png")
    case .japaneseGrandPrix:
      return UIImage(named: "Circuits/Suzuka Circuit.png")
    case .mexicanGrandPrix:
      return UIImage(named: "Circuits/Autódromo Hermanos Rodríguez.png")
    case .unitedStatesGrandPrix:
      return UIImage(named: "Circuits/Circuit of the Americas.png")
    case .brazilianGrandPrix:
      return UIImage(named: "Circuits/Autódromo José Carlos Pace.png")
    case .abuDhabiGrandPrix:
      return UIImage(named: "Circuits/Yas Marina Circuit.png")
    case .unknow:
      return UIImage(named: "Circuits/Unknow.png")
    }
  }
}
