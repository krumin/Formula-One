//
//  DriverDetailTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 15.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class DriverDetailTableViewController: UITableViewController {

  @IBOutlet weak var driverImageView: UIImageView!
  
  var standing: DriverStandings?
  
  override func viewDidLoad() {
        super.viewDidLoad()

    if let driver = standing?.driver {
    let image = DriverManager.getImage(for: driver)
      driverImageView.image = image
    }

  }
    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
