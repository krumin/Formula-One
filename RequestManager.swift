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
  enum MyError: Error {
    case badUrl
    case badData(Error)
    case noData(Error)
    case undefined
  }
  static let shared = RequestManager()
  private init() {}

  func loadRequestTrack(success: @escaping ([RaceTrackModel]) -> (), onError: @escaping (MyError) -> ()) {
    guard let myURL = URL(string: "http://ergast.com/api/f1/current.json") else {
      onError(.badUrl)
      return
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
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
    guard let myURL = URL(string: "http://ergast.com/api/f1/2019/driverStandings.json") else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        do {
          //преобразуем data в [JSON]
          let json = try JSON(data: data)
          //получаем необходимый массив [JSON]
          let drivers = json["MRData"]["StandingsTable"]["StandingsLists"].arrayValue.first!["DriverStandings"].arrayValue
          //создание модели на основе массива [JSON]
          var driversModelArray: [DriverStandings] = []
          for driverJson in drivers {
            //получаем преобразованную модель
            let driverModel = DriverStandings(with: driverJson)
            //добавляем в модель в массив и получаем массив моделей
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
    guard let myURL = URL(string: "https://ergast.com/api/f1/2019/constructorStandings.json") else {
      onError(.badUrl)
      return
    }
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        do {
          //преобразуем data в [JSON]
          let json = try JSON(data: data)
          //получаем необходимый массив [JSON]
          let constructors = json["MRData"]["StandingsTable"]["StandingsLists"].arrayValue.first!["ConstructorStandings"].arrayValue
          //создание модели на основе массива [JSON]

//          let constructorsModelArray = constructors.map { ConstructorStandings(with: $0) }
          
//          или
          
//          let constructorsModelArray = constructors.map { constructor in
//            return ConstructorStandings(with: constructor)
//          }
          
          var constructorsModelArray: [ConstructorStandings] = []
          for constructorJson in constructors {
            //получаем преобразованную модель
            let constructorModel = ConstructorStandings(with: constructorJson)
            //добавляем в модель в массив и получаем массив моделей
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


