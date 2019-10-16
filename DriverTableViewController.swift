//
//  ChampionshipsTableViewController.swift
//  Formula One
//
//  Created by MAC OS  on 21.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit


class DriverTableViewController: UITableViewController {
  
  let viewControllerSegue = "driverImageSegue"
  //var driver: DriverStandings?
  
  private var standings = [DriverStandings]() {
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
        self.standings = drivers
        print("success: driver count \(self.standings.count)")
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
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return standings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.row == 5 {
      
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellDrivers2", for: indexPath) as? DriverTableViewCell2 else {
          
          return UITableViewCell()
        }
      
        cell2.textLabel?.text = "first"
        return cell2
        
      } else {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellDrivers", for: indexPath) as? DriverTableViewCell else {
          
          return UITableViewCell()
        }
        let standing = standings[indexPath.row]
        cell.load(with: standing)
        return cell
      }
      
      
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let selectedDriver = standings[indexPath.row].driver
    
    let title = "Driver Info"
    let message = "Number: \(selectedDriver.permanentNumber), "
    
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    
    let ok = UIAlertAction(title: "Ok", style: .cancel) { _ in
    }
    
    alertController.addAction(ok)
    
    self.present(alertController, animated: true, completion: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == viewControllerSegue {
      if let indexPath = tableView.indexPathForSelectedRow {
        let destinationVC = segue.destination as! DriverDetailTableViewController
        let selectedDriver = self.standings[indexPath.row]
        destinationVC.standing = selectedDriver
      }
    }
  }
}
