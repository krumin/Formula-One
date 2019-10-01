//
//  RaceTrackTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit



class RaceTrackTableViewController: UITableViewController {

  private var track = [RaceTrackModel]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return track.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RaceTrackTableViewCell else {

        return UITableViewCell()
    }
      let tracks = track[indexPath.row]
      cell.load(with: tracks)
      return cell

  }
  

  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}