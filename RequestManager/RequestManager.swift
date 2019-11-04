//
//  RequestManager.swift
//  Formula One
//
//  Created by MAC OS  on 22.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import SwiftyJSON

class RequestManager {
  
  enum Endpoint {
    case race
    case driver
    case constructor
    case results(round: Int)
    case qualifying(round: Int)
    
    var value: String {
      switch self {
      case .race:
        return ""
      case .driver:
        return "/driverStandings"
      case .constructor:
        return "/constructorStandings"
      case .results(let round):
        return "/\(round)/results"
      case .qualifying(let round):
        return "/\(round)/qualifying"
      }
    }
  }
  
  enum MyError: Error {
    case badUrl
    case badData(Error)
    case noData(Error)
    case undefined
  }
  
  func createURL(from url: Endpoint) -> String {
    let url = "\(baseURL)/\(season)" + url.value + ".json"
    print("\(url)")
    return url
    
  }
  
  private let baseURL = "http://ergast.com/api/f1"
  private let season = "2019"
  static let shared = RequestManager()
  private init() {}
  
  func loadRequestTrack(success: @escaping ([RaceTrackModel]) -> (), onError: @escaping (MyError) -> ()) {
    let fullURLString = createURL(from: .race)
    guard let url = URL(string: fullURLString) else {
      onError(.badUrl)
      return
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: url) { (data, response, error) in
      if let data = data {
        
        do {
          //преобразуем data в [JSON]
          let json = try JSON(data: data)
          //получаем необходимый массив [JSON]
          let racesJson = json["MRData"]["RaceTable"]["Races"].arrayValue
          //создание модели на основе массива [JSON]
          var racesModelArray: [RaceTrackModel] = []
          for raceJson in racesJson {
            //получаем преобразованную модель
            let raceModel = RaceTrackModel(with: raceJson)
            //добавляем в модель в массив и получаем массив моделей
            racesModelArray.append(raceModel)
          }
          success(racesModelArray)
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
  
  func loadRequestDriver(success: @escaping ([DriverStandings]) -> (), onError: @escaping (MyError) -> ()) {
    let fullURLString = createURL(from: .driver)
    guard let myURL = URL(string: fullURLString) else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        do {
          let json = try JSON(data: data)
          let drivers = json["MRData"]["StandingsTable"]["StandingsLists"].arrayValue.first!["DriverStandings"].arrayValue
          var driversModelArray: [DriverStandings] = []
          for driverJson in drivers {
            let driverModel = DriverStandings(with: driverJson)
            driversModelArray.append(driverModel)
          }
          success(driversModelArray)
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
  
  func loadRequestConstructor(success: @escaping ([ConstructorStandings]) -> (), onError: @escaping (MyError) -> ()) {
    let fullURLString = createURL(from: .constructor)
    guard let myURL = URL(string: fullURLString) else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        do {
          let json = try JSON(data: data)
          let constructors = json["MRData"]["StandingsTable"]["StandingsLists"].arrayValue.first!["ConstructorStandings"].arrayValue
          
          //let constructorsModelArray = constructors.map { ConstructorStandings(with: $0) }
          
          //let constructorsModelArray = constructors.map { constructor in
          //return ConstructorStandings(with: constructor)
          //}
          
          var constructorsModelArray: [ConstructorStandings] = []
          for constructorJson in constructors {
            let constructorModel = ConstructorStandings(with: constructorJson)
            constructorsModelArray.append(constructorModel)
          }
          success(constructorsModelArray)
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
