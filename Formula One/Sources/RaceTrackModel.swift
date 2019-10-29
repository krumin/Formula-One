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
  let circuit: Circuit
  let country: Country
  let locality: String
  let lat: Double
  let long: Double
  let date: String
  let time: String
  let url: String
  var fullDate: Date
  
  init(with json: JSON) {
    round = json["round"].intValue
    raceName = json["raceName"].stringValue
    
    let circuitString = json["Circuit"]["circuitName"].stringValue
    circuit = Circuit(rawValue: circuitString) ?? .unknow
    
    let countryString = json["Circuit"]["Location"]["country"].stringValue
    country = Country(rawValue: countryString) ?? .unknown
    
    locality = json["Circuit"]["Location"]["locality"].stringValue
    lat = json["Circuit"]["Location"]["lat"].doubleValue
    long = json["Circuit"]["Location"]["long"].doubleValue
    date = json["date"].stringValue
    time = json["time"].stringValue
    
    let fullString = "\(date)T\(time)"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let fullDate = dateFormatter.date(from: fullString) ?? Date()
    self.fullDate = fullDate
      
    url = json["url"].stringValue
  }
}
