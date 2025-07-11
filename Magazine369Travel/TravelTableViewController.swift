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
        tableView.rowHeight = 530
        self.navigationItem.title = "SeSAC TRAVEL"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        let magazinInfoCell = magazineInfo.magazine[indexPath.row]
        let url = URL(string: magazinInfoCell.photo_image)
        
        cell.cardImageView.kf.setImage(with: url)
        cell.cardImageView.contentMode = .scaleAspectFill
        setupRadiusDegree(thing: cell.cardImageView, radiusDegree: 14)
        
        
        cell.titleLabel.text = magazinInfoCell.title
        cell.subtitleLabel.text = magazinInfoCell.subtitle
        cell.dateLabel.text = magazinInfoCell.date
        
        cell.titleLabel.numberOfLines = 2
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.subtitleLabel.textColor = .lightGray
        cell.subtitleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        cell.titleLabel.textAlignment = .left
        cell.subtitleLabel.textAlignment = .left
        cell.dateLabel.textAlignment = .right
        
        return cell
    }
    
    // 모서리 둥글기를 조절
    private func setupRadiusDegree(thing: UIView, radiusDegree: CGFloat) {
        thing.clipsToBounds = true
        thing.layer.cornerRadius = radiusDegree
        //thing.layer.borderWidth = 1
        
    }
    

}
