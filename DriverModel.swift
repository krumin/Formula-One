//
//  DriverModel.swift
//  Formula One
//
//  Created by MAC OS  on 23.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

struct DriverModel {
  let driverId: String
  let permanentNumber: Int
  let code: String
  let url: String
  var fullName: String {
    return givenName + " " + familyName
  }
  let givenName: String
  let familyName: String
  let dateOfBirth: String
  let nationalityDriver: Country
  
  init(with json: JSON) {
    driverId = json["driverId"].stringValue
    permanentNumber = json["permanentNumber"].intValue
    code = json["code"].stringValue
    url = json["url"].stringValue
    givenName = json["givenName"].stringValue
    familyName = json["familyName"].stringValue
    dateOfBirth = json["dateOfBirth"].stringValue
    
    let nationalityString = json["nationality"].stringValue
    nationalityDriver = Country(rawValue: nationalityString) ?? .unknown
  }
}
