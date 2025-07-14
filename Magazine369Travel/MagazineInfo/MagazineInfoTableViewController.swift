//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/11/25.
//

import UIKit
import Kingfisher

class MagazineInfoTableViewController: UITableViewController {

    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SeSAC TRAVEL"
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! MagazineInfoTableViewCell
        let magazinInfoCell = magazineInfo.magazine[indexPath.row]
        let url = URL(string: magazinInfoCell.photo_image)
        
        cell.cardImageView.kf.setImage(with: url)
        cell.titleLabel.text = magazinInfoCell.title
        cell.subtitleLabel.text = magazinInfoCell.subtitle
        cell.dateLabel.text = magazinInfoCell.date.formattedMagazineDate()
    
        return cell
    }
    
    // 모서리 둥글기를 조절
    private func setupRadiusDegree(thing: UIView, radiusDegree: CGFloat) {
        thing.clipsToBounds = true
        thing.layer.cornerRadius = radiusDegree
    }

}
