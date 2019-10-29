//
//  DriverInfoTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 16.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit
import SafariServices

class DriverInfoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var driverImageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  var driverStanding: DriverStandings?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.bounces = false
    tableView.alwaysBounceVertical = false
    tableView.estimatedRowHeight = 44
    
    if let driver = driverStanding?.driver {
      let image = DriverManager.getImageDriver(for: driver)
      driverImageView.image = image
    }
  }
}

// MARK: - UITableViewDataSource

extension DriverInfoTableViewController {
 
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      
      guard let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? DriverMainTableViewCell else {
        
        return UITableViewCell()
      }
      mainCell.selectionStyle = .none
      
      if let driver = driverStanding {
        mainCell.load(with: driver)
      }
      return mainCell
    } else {
      
      guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? DriverInfoTableViewCell else {
        
        return UITableViewCell()
      }
      infoCell.selectionStyle = .none
      
      if let driver = driverStanding {
        infoCell.load(with: driver)
      }
      return infoCell
    }
  }
}

// MARK: - UITableViewDelegate

extension DriverInfoTableViewController {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return tableView.bounds.size.height
    } else {
      return 350
    }
  }
  
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  
  if indexPath.row == 0 {
    if let driver = driverStanding {
      showSafari(with: driver)      
    }
  }
}
  
func showSafari(with standing:DriverStandings) {
    let constructorsUrl = standing.driver
    guard let url = URL(string: constructorsUrl.url) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    self.present(safariVC, animated: true, completion: nil)
  }
}
