//
//  RaceTrackTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class RaceTrackTableViewController: UITableViewController {
  
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
    
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
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
}

// MARK: - UITableViewDataSource

extension RaceTrackTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return track.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RaceTrackTableViewCell else {
      
      return UITableViewCell()
    }
    cell.selectionStyle = .none
    let tracks = track[indexPath.row]
    cell.loadData(with: tracks)
    return cell
  }
}

// MARK: - UITableViewDelegate

extension RaceTrackTableViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - Navigation

extension RaceTrackTableViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let viewControllerSegue = "trackSegue"
    if segue.identifier == viewControllerSegue {
      if let indexPath = tableView.indexPathForSelectedRow {
        let destinationVC = segue.destination as! DetailTrackViewController
        destinationVC.race = self.track[indexPath.row]
      }
    }
  }
}


