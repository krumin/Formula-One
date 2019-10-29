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
  let grid: Int
  let laps: Int
  let status: String
  let resultTime: String
  let lap: Int
  let timeLap: String
  
  init(with json: JSON) {
    driver = DriverModel(with: json["Driver"])
    constructor = ConstructorModel(with: json["Constructor"])
    
    grid = json["grid"].intValue
    laps = json["laps"].intValue
    status = json["status"].stringValue
    resultTime = json["Time"]["time"].stringValue
    lap = json["FastestLap"]["lap"].intValue
    timeLap = json["FastestLap"]["Time"]["time"].stringValue
    
  }
}
