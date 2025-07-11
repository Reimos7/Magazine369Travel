//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/11/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {

    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 520
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        cell.cardImageView.image = UIImage(systemName: "star.fill")
        cell.titleLabel.text = "dd"
        cell.subtitleLabel.text = "test"
        cell.dateLabel.text = "25년 11월 11일"
        
        return cell
    }
    

}
