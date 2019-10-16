//
//  TrackImage.swift
//  
//
//  Created by MAC OS  on 25.09.2019.
//

import Foundation
import UIKit

enum Country {
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
  case finland
  case netherlands
  case thailand
  case denmark
  case poland
  case unknown
  
  var flag: UIImage {
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
      return UIImage(named: "Austria.png")!
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
      return UIImage(named: "Singapore.png")!
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
    case .finland:
      return UIImage(named: "Finland.png")!
    case .netherlands:
      return UIImage(named: "Netherlands.png")!
    case .thailand:
      return UIImage(named: "Thailand.png")!
    case .denmark:
      return UIImage(named: "Denmark.png")!
    case .poland:
      return UIImage(named: "Poland.png")!
    case .unknown:
      return UIImage(named: "Unknown.png")!
    }
  }
}

extension Country: RawRepresentable {
  
  typealias RawValue = String
  
  init?(rawValue: RawValue) {
    switch rawValue {
    case "Australia", "Australian": self = .australia
    case "Bahrain": self = .bahrain
    case "China": self = .china
    case "Azerbaijan": self = .azerbaijan
    case "Spain", "Spanish": self = .spain
    case "Monaco", "Monegasque": self = .monaco
    case "Canada", "Canadian": self = .canada
    case "France", "French": self = .france
    case "Austria", "Austrian": self = .austia
    case "UK", "British": self = .unitedKingdom
    case "Germany", "German": self = .germany
    case "Hungary": self = .hungary
    case "Belgium": self = .belgium
    case "Italy", "Italian": self = .italy
    case "Singapore": self = .singapure
    case "Russia", "Russian": self = .russia
    case "Japan": self = .japan
    case "Mexico", "Mexican": self = .mexico
    case "USA", "American": self = .unitedStates
    case "Brazil": self = .brazil
    case "UAE": self = .unitedArabEmirates
    case "Finland", "Finnish": self = .finland
    case "Netherlands", "Dutch": self = .netherlands
    case "Thailand","Thai": self = .thailand
    case "Denmark", "Danish": self = .denmark
    case "Poland", "Polish": self = .poland
    case "Unknown": self = .unknown
    default:
      return nil
    }
  }
  
  var rawValue: RawValue {
    switch self {
    case .australia: return "Australia"
    case .bahrain: return "Bahrain"
    case .china: return "China"
    case .azerbaijan: return "Azerbaijan"
    case .spain: return "Spain"
    case .monaco: return "Monaco"
    case .canada: return "Canada"
    case .france: return "France"
    case .austia: return "Austria"
    case .unitedKingdom: return "UK"
    case .germany: return "Germany"
    case .hungary: return "Hungary"
    case .belgium: return "Belgium"
    case .italy: return "Italy"
    case .singapure: return "Singapore"
    case .russia: return "Russia"
    case .japan: return "Japan"
    case .mexico: return "Mexico"
    case .unitedStates: return "USA"
    case .brazil: return "Brazil"
    case .unitedArabEmirates: return "UAE"
    case .finland: return "Finland"
    case .netherlands: return "Netherlands"
    case .thailand: return "Thailand"
    case .denmark: return "Denmark"
    case .poland: return "Poland"
    case .unknown: return "Unknown"
    }
  }
}
