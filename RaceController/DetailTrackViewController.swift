//
//  DetailTrackViewController.swift
//  
//
//  Created by MAC OS  on 25.09.2019.
//

import UIKit

class DetailTrackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  enum RaceType: Int {
    case qualifying
    case results
  }
  
  var selectedType: RaceType = .qualifying
  
  @IBOutlet weak var trackImageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var trackNameTextLabel: UILabel!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  var race: RaceTrackModel?
  
  var results = [RaceResultsModel]() {
    didSet {
      print("results did set: \(results)")
    }
  }
  var qualifying = [QualifyingResultsModel]() {
    didSet {
      print("qualifying did set: \(qualifying)")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let race = race else {
      assertionFailure("no race")
      return
    }
    
    trackImageView.image = race.circuit.image
    trackNameTextLabel.text = race.locality 
    
    title = race.raceName
    
    loadData(for: race, success: {
      print("data is loaded")
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }, failure: { error in
      print("data is not loaded. error: \(error)")
    })
  }
  
  @IBAction func segmentedTap(_ sender: Any) {
    let type = segmentedControl.selectedSegmentIndex
    let raceType = RaceType(rawValue: type) ?? .qualifying
    selectedType = raceType
    tableView.reloadData()
  }
}

// MARK: - Load data

extension DetailTrackViewController {
  
  func loadData(for race: RaceTrackModel, success: @escaping (() -> (Void)), failure: @escaping ((Error) -> (Void))) {
    RequestManager.shared.loadResultsFor(race: race, success: { [weak self] results in
      guard let self = self else { return }
      self.results = results
      
      RequestManager.shared.loadQualifyingResultsFor(race: race, success: { [weak self] qualifying in
        guard let self = self else { return }
        self.qualifying = qualifying
        success()
      }) { error in
        print(error)
        success()
      }
    }) { error in
      RequestManager.shared.loadQualifyingResultsFor(race: race, success: { [weak self] qualifying in
        guard let self = self else { return }
        self.qualifying = qualifying
        success()
      }) { error in
        failure(error)
        print(error)
      }
      failure(error)
      print(error)
    }
  }
}

// MARK: - UITableViewDataSource

extension DetailTrackViewController {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch selectedType {
    case .qualifying:
      return qualifying.count
    case .results:
      if results.count > 0 {
        return results.count + 1
      } else {
        return results.count
      }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch selectedType {
    case .qualifying:
      guard let qualifyingResultCell = tableView.dequeueReusableCell(withIdentifier: "qualifyingResultCell", for: indexPath) as? QualifyingResultTableViewCell else {
        
        return UITableViewCell()
      }
      let result = qualifying[indexPath.row]
      qualifyingResultCell.loadData(with: result, number: indexPath.row + 1)
      
      return qualifyingResultCell
      
    case .results:
      if indexPath.row == results.count {
        //print("test. index path: \(indexPath.row)")
        //print("test. is last")
        guard let fastLapCell = tableView.dequeueReusableCell(withIdentifier: "fastLapCell", for: indexPath) as? RaceFastLapTableViewCell else {
          
          return UITableViewCell()
        }
        
        if let fastResult = results.first(where: { $0.rank == 1 }) {
          fastLapCell.loadData(with: fastResult)
        }
        return fastLapCell
        
      } else {
        
        //print("test. index path: \(indexPath.row)")
        //print("test. not last")
        guard let raceResultCell = tableView.dequeueReusableCell(withIdentifier: "raceResultCell", for: indexPath) as? RaceResultTableViewCell else {
          
          return UITableViewCell()
        }
        let result = results[indexPath.row]
        raceResultCell.loadData(with: result, number: indexPath.row + 1)
        
        return raceResultCell
      }
    }
  }
}

// MARK: - Navigation

extension DetailTrackViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let viewControllerSegue = "locationSegue"
    if segue.identifier == viewControllerSegue {
      let destinationVC = segue.destination as! MapViewController
      destinationVC.race = self.race
    }
  }
}
