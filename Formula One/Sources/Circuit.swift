//
//  Circuit.swift
//  Formula One
//
//  Created by MAC OS  on 09.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import UIKit
//import MapKit

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
//  var location: CLLocationCoordinate2D {
//    switch self {
//    case .australianGrandPrix:
//      return CLLocationCoordinate2D(latitude: -37.8497, longitude: 144.968)
//    case .bahrainGrandPrix:
//      return CLLocationCoordinate2D(latitude: 26.0325, longitude: 50.5106)
//    case .chineseGrandPrix:
//      return CLLocationCoordinate2D(latitude: 31.3389, longitude: 121.22)
//    case .azerbaijanGrandPrix:
//      return CLLocationCoordinate2D(latitude: 40.3725, longitude: 49.8533)
//    case .spanishGrandPrix:
//      return CLLocationCoordinate2D(latitude: 41.57, longitude: 2.26111)
//    case .monacoGrandPrix:
//      return CLLocationCoordinate2D(latitude: 43.7347, longitude: 7.42056)
//    case .canadianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 45.5, longitude: -73.5228)
//    case .frenchGrandPrix:
//      return CLLocationCoordinate2D(latitude: 43.2506, longitude: 5.79167)
//    case .austrianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 47.2197, longitude: 14.7647)
//    case .britishGrandPrix:
//      return CLLocationCoordinate2D(latitude: 52.0786, longitude: -1.01694)
//    case .germanGrandPrix:
//      return CLLocationCoordinate2D(latitude: 49.3278, longitude: 8.56583)
//    case .hungarianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 47.5789, longitude: 19.2486)
//    case .belgianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 50.4372, longitude: 5.97139)
//    case .italianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 45.6156, longitude: 9.28111)
//    case .singaporeGrandPrix:
//      return CLLocationCoordinate2D(latitude: 1.2914, longitude: 103.864)
//    case .russianGrandPrix:
//      return CLLocationCoordinate2D(latitude: 43.4057, longitude: 39.9578)
//    case .japaneseGrandPrix:
//      return CLLocationCoordinate2D(latitude: 34.8431, longitude: 136.541)
//    case .mexicanGrandPrix:
//      return CLLocationCoordinate2D(latitude: 19.4042, longitude: -99.0907)
//    case .unitedStatesGrandPrix:
//      return CLLocationCoordinate2D(latitude: 30.1328, longitude: -97.6411)
//    case .brazilianGrandPrix:
//      return CLLocationCoordinate2D(latitude: -23.7036, longitude: -46.6997)
//    case .abuDhabiGrandPrix:
//      return CLLocationCoordinate2D(latitude: 24.4672, longitude: 54.6031)
//    case .unknow:
//      return CLLocationCoordinate2D(latitude: 55.183807, longitude: 30.201516)
//    }
//  }
}
