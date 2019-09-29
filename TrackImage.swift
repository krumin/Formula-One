//
//  TrackImage.swift
//  
//
//  Created by MAC OS  on 25.09.2019.
//

import Foundation
import UIKit

class Image {
  let image: TrackImage?

  init(image: TrackImage? = nil) {
    self.image = image
  }
  
}

enum TrackImage: CaseIterable {
  case australia
  case bahrain
  case china
  case azerbaijan
  case spain
  case monaco
  case canada
  case france
  case austia
  case unitedKingdom
  case germany
  case hungary
  case belgium
  case italy
  case singapure
  case russia
  case japan
  case mexico
  case unitedStates
  case brazil
  case unitedArabEmirates
  
  var image: UIImage {
    switch self {
    case .australia:
      return UIImage(named: "Australia.png")!
    case .bahrain:
      return UIImage(named: "Bahrain.png")!
    case .china:
      return UIImage(named: "China.png")!
    case .azerbaijan:
      return UIImage(named: "Azerbaijan.png")!
    case .spain:
      return UIImage(named: "Spain.png")!
    case .monaco:
      return UIImage(named: "Monaco.png")!
    case .canada:
      return UIImage(named: "Canada.png")!
    case .france:
      return UIImage(named: "France.png")!
    case .austia:
      return UIImage(named: "Austia.png")!
    case .unitedKingdom:
      return UIImage(named: "United Kingdom.png")!
    case .germany:
      return UIImage(named: "Germany.png")!
    case .hungary:
      return UIImage(named: "Hungary.png")!
    case .belgium:
      return UIImage(named: "Belgium.png")!
    case .italy:
      return UIImage(named: "Italy.png")!
    case .singapure:
      return UIImage(named: "Singapure.png")!
    case .russia:
      return UIImage(named: "Russia.png")!
    case .japan:
      return UIImage(named: "Japan.png")!
    case .mexico:
      return UIImage(named: "Mexico.png")!
    case .unitedStates:
      return UIImage(named: "United States.png")!
    case .brazil:
      return UIImage(named: "Brazil.png")!
    case .unitedArabEmirates:
      return UIImage(named: "United Arab Emirates.png")!
    }
  }
  
}
