//
//  RequestManager+RaceTrack.swift
//  Formula One
//
//  Created by MAC OS  on 26.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

extension RequestManager {
  
  func loadResultsFor(race: RaceTrackModel, success: @escaping ([RaceResultsModel]) -> (), onError: @escaping (MyError) -> ()) {
    let fullURLString = createURL(from: .results(round: race.round))
    guard let url = URL(string: fullURLString) else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: url) { (data, response, error) in
      if let data = data {
        
        do {
          let json = try JSON(data: data)
          guard let race = json["MRData"]["RaceTable"]["Races"].arrayValue.first else {
            let error = NSError(domain: "There isn't any races", code: 0, userInfo: nil)
            onError(.noData(error))
            return
          }
          let results = race["Results"].arrayValue
          var raceResultsModelsArray: [RaceResultsModel] = []
          for resultJson in results {
            let resultModel = RaceResultsModel(with: resultJson)
            raceResultsModelsArray.append(resultModel)
          }
          success(raceResultsModelsArray)
        } catch let error {
          onError(.badData(error))
        }
      } else {
        if let error = error {
          onError(.noData(error))
        } else {
          onError(.undefined)
        }
      }
      }.resume()
  }
  
  func loadQualifyingResultsFor(race: RaceTrackModel, success: @escaping ([QualifyingResultsModel]) -> (), onError: @escaping (MyError) -> ()) {
    let fullURLString = createURL(from: .qualifying(round: race.round))
    guard let url = URL(string: fullURLString) else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: url) { (data, response, error) in
      if let data = data {
        
        do {
          let json = try JSON(data: data)
          guard let race = json["MRData"]["RaceTable"]["Races"].arrayValue.first else {
            let error = NSError(domain: "There isn't any races", code: 0, userInfo: nil)
            onError(.noData(error))
            return
          }
          let results = race["QualifyingResults"].arrayValue
          var qualifyingResultsModelsArray: [QualifyingResultsModel] = []
          for resultJson in results {
            let resultModel = QualifyingResultsModel(with: resultJson)
            qualifyingResultsModelsArray.append(resultModel)
          }
          success(qualifyingResultsModelsArray)
        } catch let error {
          onError(.badData(error))
        }
      } else {
        if let error = error {
          onError(.noData(error))
        } else {
          onError(.undefined)
        }
      }
      }.resume()
  }
}
