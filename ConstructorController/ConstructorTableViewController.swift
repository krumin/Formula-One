//
//  ConstructorTableViewController.swift
//  
//
//  Created by MAC OS  on 08.10.2019.
//

import UIKit
import SafariServices

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
}

// MARK: - UITableViewDataSource

extension ConstructorTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return standings.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellConstructors", for: indexPath) as? ConstructorTableViewCell else {
      
      return UITableViewCell()
    }
    cell.selectionStyle = .none
    let standing = standings[indexPath.row]
    cell.load(with: standing)
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let standing = standings[indexPath.row]
    showSafari(with: standing)
  }
  
  func showSafari(with standing:ConstructorStandings) {
    let constructorsUrl = standing.constructor
    guard let url = URL(string: constructorsUrl.url) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    self.present(safariVC, animated: true, completion: nil)
  }
}
