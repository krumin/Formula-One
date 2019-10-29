//
//  ConstructorStandings.swift
//  
//
//  Created by MAC OS  on 08.10.2019.
//

import Foundation
import SwiftyJSON

struct ConstructorStandings {
  let position: Int
  let points: Int
  let wins: Int
  let constructor: ConstructorModel
  
  init(with json: JSON) {
    position = json["position"].intValue
    points = json["points"].intValue
    wins = json["wins"].intValue
    constructor = ConstructorModel(with: json["Constructor"])
  }
}
