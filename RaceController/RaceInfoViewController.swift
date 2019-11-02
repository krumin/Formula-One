//
//  RaceViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class RaceInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  enum Race: Int {
    case beginning
    case ended
  }
  
  var selectedSegment: Race = .beginning
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var raceNameLabel: UILabel!
  @IBOutlet weak var infoLabel: UILabel!
  
  var seconds = 60
  var timer = Timer()
  
  var race: RaceTrackModel?
  
  private var track = [RaceTrackModel]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      runTimer()
      
      infoLabel.text = "Grand Prix start"
      
      RequestManager.shared.loadRequestTrack(success: { [weak self] tracks in
        guard let self = self else { return }
        self.track = tracks
        print("success: track count \(self.track.count)")
        }, onError: { error in
          switch error {
          case .badUrl:
            print("ooops. bad url")
          case .badData(let error):
            print("ooops. bad text error: \(error)")
          case .noData(let myError):
            print("no data error: \(myError.localizedDescription)")
          case .undefined:
            print("undefined")
          }
      })
  }
  
  @IBAction func segmentedTap(_ sender: Any) {
    let segment = segmentedControl.selectedSegmentIndex
    let race = Race(rawValue: segment) ?? .beginning
    selectedSegment = race
    tableView.reloadData()
  }
  
  func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  }
  @objc func updateTimer() {
    seconds -= 1
    timerLabel.text = timeString(interval: TimeInterval(seconds))
  }
  func timeString(interval: TimeInterval) -> String {
    let interval = Int(interval)
    let days = (interval / 86400)
    let hours = (interval / 3600)
    let minutes = (interval / 60) % 60
    let seconds = interval % 60
    return String(format: "%02i:%02i:%02i:%02i", days, hours, minutes, seconds)
  }
}

// MARK: - UITableViewDataSource

extension RaceInfoViewController {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch selectedSegment {
    case .beginning:
      return track.count
    case .ended:
      return track.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch selectedSegment {
    case .beginning:
      guard let raceBeginningCell = tableView.dequeueReusableCell(withIdentifier: "raceBeginningCell", for: indexPath) as? RaceBeginningTableViewCell else {
        
        return UITableViewCell()
      }
      let tracks = track[indexPath.row]
      raceBeginningCell.loadData(with: tracks)
      return raceBeginningCell

    case.ended:
      guard let raceEndedCell = tableView.dequeueReusableCell(withIdentifier: "raceEndedCell", for: indexPath) as? RaceEndedTableViewCell else {
        
        return UITableViewCell()
      }
      let tracks = track[indexPath.row]
      raceEndedCell.loadData(with: tracks)
      return raceEndedCell
      
    }
  }
}
