//
//  CitysTableViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit

class CityTableViewCell: UITableViewCell {

   static let identifier = "CityTableViewCell"
    
    @IBOutlet var backgroundCellView: UIView!
    
    @IBOutlet var cityImage: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    
    @IBOutlet var cityExplainLabel: UILabel!
    
    @IBOutlet var cityExplainBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        cityImage.contentMode = .scaleAspectFill
        
        backgroundView?.backgroundColor = .red
       
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 26)
        cityNameLabel.textAlignment = .right
        
        cityNameLabel.textColor = .white
        cityExplainLabel.textColor = .white
        cityExplainLabel.textAlignment = .left
        cityExplainLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func configure(cityInfoCell: City) {
        let url = URL(string: cityInfoCell.city_image)
        
        cityImage.kf.setImage(with: url)
        
        cityNameLabel.text = "\(cityInfoCell.city_name) | \(cityInfoCell.city_english_name)"
        
        cityExplainLabel.text = cityInfoCell.city_explain
    }
    
    
   
    
    
    
    
    
    
}
