//
//  CityTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit
import Kingfisher

class CityTableViewController: UITableViewController {
    
    let cityInfo = CityInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        tableView.rowHeight = 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityInfoCell = cityInfo.city[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        cell.configure(cityInfoCell: cityInfoCell)
        
        return cell
    }
}
