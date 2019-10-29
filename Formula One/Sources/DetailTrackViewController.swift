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
      print("test. results did set: \(results)")
    }
  }
  var qualifying = [QualifyingResultsModel]() {
    didSet {
      print("test. results did set: \(qualifying)")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //tableView.estimatedRowHeight = 44
    guard let race = race else {
      assertionFailure("no race")
      return
    }
    
    trackImageView.image = race.circuit.image
    trackNameTextLabel.text = race.locality
    
    title = race.raceName
    
    loadData(for: race, success: {
      print("test. data is loaded")
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }, failure: { error in
      print("test. data is not loaded. error: \(error)")
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
      return results.count
    }
    //      if segmentedControl.selectedSegmentIndex == 0 {
    //        return qualifying.count
    //      } else {
    //        tableView.reloadData()
    //        return results.count
    //      }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch selectedType {
    case .qualifying:
      guard let mainCell = tableView.dequeueReusableCell(withIdentifier: "mailCell", for: indexPath) as? TrackMainTableViewCell else {
        
        return UITableViewCell()
      }
      let result = qualifying[indexPath.row]
      mainCell.load(with: result, number: indexPath.row + 1)
      
      return mainCell
      
    case .results:
      guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? TrackInfoTableViewCell else {
        
        return UITableViewCell()
      }
      let result = results[indexPath.row]
      infoCell.load(with: result, number: indexPath.row + 1)
  
      return infoCell
      
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
