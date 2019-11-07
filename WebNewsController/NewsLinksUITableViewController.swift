//
//  News.swift
//  Formula One
//
//  Created by MAC OS  on 07.11.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit
import SafariServices

class NewsLinksUITableViewController: UITableViewController {
  
  var links: [SportsLinks] = [
    SportsLinks(name: "The official site F1.com", ulr: "https://www.formula1.com/en.html"),
    SportsLinks(name: "F1NEWS", ulr: "https://www.f1news.ru/"),
    SportsLinks(name: "WIKI F1", ulr: "https://ru.wikipedia.org/wiki/%D0%A4%D0%BE%D1%80%D0%BC%D1%83%D0%BB%D0%B0-1"),
    SportsLinks(name: "F1-world", ulr: "https://www.f1-world.ru/"),
    SportsLinks(name: "Motorsport", ulr: "https://ru.motorsport.com/f1/news/"),
    SportsLinks(name: "F1report", ulr: "https://f1report.ru/"),
    SportsLinks(name: "Sports.ru", ulr: "https://www.sports.ru/f1-championship/"),
    SportsLinks(name: "Myscore", ulr: "https://www.myscore.com.ua/auto-racing/formula-1/"),
    SportsLinks(name: "Sportbox", ulr: "https://news.sportbox.ru/Vidy_sporta/Avtosport/Formula_1"),
    
    ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.tableFooterView = UIView(frame: .zero)
  }
}

// MARK: - UITableViewDataSource

extension NewsLinksUITableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return links.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsLinksTableViewCell else {
      
      return UITableViewCell()
    }
    //cell.selectionStyle = .none
    let link = links[indexPath.row]
    newsCell.loadData(with: link)
    return newsCell
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let link = links[indexPath.row]
    showSafari(with: link)
  }
  
  // Method ShowSafari
  func showSafari(with link:SportsLinks) {
    let linksUrl = link.ulr
    guard let url = URL(string: linksUrl) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    self.present(safariVC, animated: true, completion: nil)
    
  }
}
