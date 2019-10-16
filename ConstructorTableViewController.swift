//
//  ConstructorTableViewController.swift
//  
//
//  Created by MAC OS  on 08.10.2019.
//

import UIKit

class ConstructorTableViewController: UITableViewController {

  private var standings = [ConstructorStandings]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    RequestManager.shared.loadRequestConstructor(success: { [weak self] constructors in
      guard let self = self else { return }
      self.standings = constructors
      print("success: constructor count \(self.standings.count)")
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
    
    return standings.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellConstructors", for: indexPath) as? ConstructorTableViewCell else {
      
      return UITableViewCell()
    }
    let standing = standings[indexPath.row]
    cell.load(with: standing)
    return cell
    
  }
  
//  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 100
//  }
    /*
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

