//
//  QualifyingResults.swift
//  
//
//  Created by MAC OS  on 19.10.2019.
//

import Foundation
import SwiftyJSON

struct QualifyingResultsModel {
  let driver: DriverModel
  let constructor: ConstructorModel
  let q1: String
  let q2: String
  let q3: String
  
  init(with json: JSON) {
    driver = DriverModel(with: json["Driver"])
    constructor = ConstructorModel(with: json["Constructor"])
    q1 = json["Q1"].stringValue
    q2 = json["Q2"].stringValue
    q3 = json["Q3"].stringValue
  }
}
