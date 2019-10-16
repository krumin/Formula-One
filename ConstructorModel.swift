//
//  TeamDriver.swift
//  
//
//  Created by MAC OS  on 25.09.2019.
//

import Foundation
import SwiftyJSON

struct ConstructorModel {
  let constructorId: String
  let url: String
  let name: String
  let nationalityConstructor: Country
  
  init(with json: JSON) {
    constructorId = json["constructorId"].stringValue
    url = json["url"].stringValue
    name = json["name"].stringValue
    let nationalityString = json["nationality"].stringValue
    nationalityConstructor = Country(rawValue: nationalityString) ?? .unknown
  }
}
