//
//  ChampionshipsTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit


class DriverTableViewController: UITableViewController {
  
  private var driver = [DriverStandings]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      
      RequestManager.shared.loadRequestDriver(success: { [weak self] drivers in
        guard let self = self else { return }
        self.driver = drivers
        print("success: driver count \(self.driver.count)")
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return driver.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellDriver", for: indexPath) as? DriverTableViewCell else {
        
        return UITableViewCell()
      }
      let drivers = driver[indexPath.row]
      //cell.textLabel?.text = String(drivers.driver.permanentNumber)
      cell.load(with: drivers)
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
