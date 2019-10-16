//
//  DetailTrackViewController.swift
//  
//
//  Created by MAC OS  on 25.09.2019.
//

import UIKit

class DetailTrackViewController: UITableViewController {

  @IBOutlet weak var trackImageView: UIImageView!
  
  var race: RaceTrackModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()

  
      if let race = race?.circuit {
        trackImageView.image = race.image
        
      }
  }
}
