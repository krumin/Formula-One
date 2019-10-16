//
//  RaceTrackModel.swift
//  Formula One
//
//  Created by MAC OS  on 22.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

struct RaceTrackModel {
  let round: Int
  let raceName: String
  var circuit: Circuit
  let country: Country
  //let date: Date
  //let time: Date
  let url: String
  
  init(with json: JSON) {
    round = json["round"].intValue
    raceName = json["raceName"].stringValue
    let circuitString = json["Circuit"]["circuitName"].stringValue
    circuit = Circuit(rawValue: circuitString) ?? .unknow
    let countryString = json["Circuit"]["Location"]["country"].stringValue
    country = Country(rawValue: countryString) ?? .unknown
    //date = json["date"]
    //time = json["time"].intValue
    url = json["url"].stringValue
  }
}
