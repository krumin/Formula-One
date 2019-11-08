//
//  RaceViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit
import SafariServices

class RaceInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  enum Race: Int {
    case beginning
    case ended
  }
  
  var selectedSegment: Race = .beginning
  
  @IBOutlet weak var flagImageView: UIImageView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var raceNameLabel: UILabel!
  @IBOutlet weak var infoLabel: UILabel!
  
  var timer: Timer?
  var timerCurrentTimeInterval: TimeInterval = 0
  
  var nextRace: RaceTrackModel?
  
  // Future tracks
  private var raceBeginning = [RaceTrackModel]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  // Past tracks
  private var raceEnded = [RaceTrackModel]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadData()
    tableView.tableFooterView = UIView(frame: .zero)
  }

  // Need stop timer when controller will deinit
  deinit {
    stopTimer()
  }
}

// MARK: - Setup Layout

extension RaceInfoViewController {

  func setupNextRaceLayout() {
    guard let nextRace = self.nextRace else { return }
    infoLabel.text = "Next race:"
    flagImageView.image = nextRace.country.flag
    raceNameLabel.text = nextRace.raceName
  }
}

// MARK: - Load data

extension RaceInfoViewController {

  func loadData() {
    RequestManager.shared.loadRequestTrack(success: { [weak self] tracks in
      guard let self = self else { return }
      self.parseTracks(tracks)

      // Start timer and setup UI on main thread
      DispatchQueue.main.async {
        self.setupNextRaceLayout()
        self.startTimer()
      }
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

  func parseTracks(_ tracks: [RaceTrackModel]) {
    // Get future tracks
    self.raceBeginning = self.getFutureTracks(tracks)
    print("success: FutureTracks count \(self.raceBeginning.count)")
    // Get past tracks
    self.raceEnded = self.getPastTracks(tracks)
    print("success: PastTracks count \(self.raceEnded.count)")
    // Get next race
    self.nextRace = self.getNextTrack(tracks: self.raceBeginning)
  }
}

// MARK: - Private methods

extension RaceInfoViewController {
  private func getNextTrack(tracks: [RaceTrackModel]) -> RaceTrackModel? {
    var foundTrack: RaceTrackModel? = tracks.first
    guard let unwrappedFoundTrack = foundTrack else { return nil }
    for track in tracks {
      if track.fullDate < unwrappedFoundTrack.fullDate {
        foundTrack = track
        print(track)
      }
    }
    return foundTrack
  }

  // MARK: - Sort tracks

  private func getFutureTracks(_ tracks: [RaceTrackModel]) -> [RaceTrackModel] {
    let date = Date()
    var arrayFutureTracks:[RaceTrackModel] = []
    for track in tracks {
      if date < track.fullDate {
        arrayFutureTracks.append(track)
        print(track)
      }
    }
    return arrayFutureTracks
  }

  private func getPastTracks(_ tracks: [RaceTrackModel]) -> [RaceTrackModel] {
    let date = Date()
    var arrayPastTracks:[RaceTrackModel] = []
    for track in tracks {
      if date > track.fullDate {
        arrayPastTracks.append(track)
      }
    }
    return arrayPastTracks
  }

  // MARK: - Segmented control did tap
  
  @IBAction func segmentedTap(_ sender: Any) {
    let segment = segmentedControl.selectedSegmentIndex
    let race = Race(rawValue: segment) ?? .beginning
    selectedSegment = race
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension RaceInfoViewController {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch selectedSegment {
    case .beginning:
      return raceBeginning.count
    case .ended:
      return raceEnded.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch selectedSegment {
    case .beginning:
      guard let raceBeginningCell = tableView.dequeueReusableCell(withIdentifier: "raceBeginningCell", for: indexPath) as? RaceBeginningTableViewCell else {
        
        return UITableViewCell()
      }
      raceBeginningCell.selectionStyle = .none
      let tracks = raceBeginning[indexPath.row]
      raceBeginningCell.loadData(with: tracks)
      return raceBeginningCell
      
    case.ended:
      guard let raceEndedCell = tableView.dequeueReusableCell(withIdentifier: "raceEndedCell", for: indexPath) as? RaceEndedTableViewCell else {
        
        return UITableViewCell()
      }
      raceEndedCell.selectionStyle = .none
      let tracks = raceEnded[indexPath.row]
      raceEndedCell.loadData(with: tracks)
      return raceEndedCell
      
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch selectedSegment {
    case .beginning:
      let futureTracks = raceBeginning[indexPath.row]
      showSafari(with: futureTracks)
    case .ended:
      let pastTracks = raceEnded[indexPath.row]
      showSafari(with: pastTracks)
    }
  }
  
  // Method ShowSafari
  func showSafari(with race:RaceTrackModel) {
    let tracksUrl = race.url
    guard let url = URL(string: tracksUrl) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    self.present(safariVC, animated: true, completion: nil)
  }
}

// MARK: - Setup Timer

extension RaceInfoViewController {

  func startTimer() {

    guard let nextRace = self.nextRace else { return }

    timerCurrentTimeInterval = nextRace.fullDate.timeIntervalSinceNow

    // Before start timer it need stop
    
    stopTimer()

    let timer = Timer.scheduledTimer(
      timeInterval: 1,
      target: self,
      selector: #selector(updateTimer),
      userInfo: nil,
      repeats: true)

    self.timer = timer

    RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
  }

  func stopTimer() {
    timer?.invalidate()
    timer = nil
  }

  @objc func updateTimer() {
    if timerCurrentTimeInterval == 0 {
      stopTimer()
      timerLabel.text = "The race started!"

      //subtitlesContainer.isHidden = true
    } else {
      timerCurrentTimeInterval -= 1
      timerLabel.text = timeString(interval: TimeInterval(timerCurrentTimeInterval))
    }
  }

  func timeString(interval: TimeInterval) -> String {
    let interval = Int(interval)
    let days = (interval / 86400)
    let hours = (interval / 86400) % 24
    let minutes = (interval / 60) % 60
    let seconds = interval % 60
    return String(format: "%02i : %02i : %02i : %02i", days, hours, minutes, seconds)
  }
}
