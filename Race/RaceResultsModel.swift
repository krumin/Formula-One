//
//  RaceResults.swift
//  Formula One
//
//  Created by MAC OS  on 19.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

struct RaceResultsModel {
  let driver: DriverModel
  let constructor: ConstructorModel
  let startGrid: Int
  let totalLaps: Int
  let status: String
  let resultRaceTime: String?
  let rank: Int
  let lap: Int
  let fastTimeLap: String
  
  init(with json: JSON) {
    driver = DriverModel(with: json["Driver"])
    constructor = ConstructorModel(with: json["Constructor"])
    
    startGrid = json["grid"].intValue
    totalLaps = json["laps"].intValue
    status = json["status"].stringValue
    resultRaceTime = json["Time"]["time"].string
    lap = json["FastestLap"]["lap"].intValue
    fastTimeLap = json["FastestLap"]["Time"]["time"].stringValue
    rank = json["FastestLap"]["rank"].intValue
  }
}
