//
//  DriverStandings.swift
//  Formula One
//
//  Created by MAC OS  on 23.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

struct DriverStandings {
  let position: Int
  let points: Int
  let wins: Int
  let driver: DriverModel
  let constructors: [ConstructorModel]
  
  init(with json: JSON) {
    position = json["position"].intValue
    points = json["points"].intValue
    wins = json["wins"].intValue
    driver = DriverModel(with: json["Driver"])
    
    let constructorsJson = json["Constructors"].arrayValue
    var modelArray: [ConstructorModel] = []
    for contstructor in constructorsJson {
      let constructorModel = ConstructorModel(with: contstructor)
      modelArray.append(constructorModel)
    }
    constructors = modelArray
  }
}
