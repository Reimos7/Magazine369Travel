//
//  CityTableViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/16/25.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    static let identifier = "CityTableViewCell"
    
    @IBOutlet var backgroundCellView: UIView!
    
    @IBOutlet var cityImage: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    
    @IBOutlet var cityExplainBackgroundView: UIView!

    @IBOutlet var cityExplainLabel: UILabel!
    
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
        
        cityExplainBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        cityImage.clipsToBounds = true
        cityImage.layer.cornerRadius = 20
        // 특정 모서리 적용
        cityImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func configure(city: City, keyword: String?) {
        let url = URL(string: city.city_image)
        
        cityImage.kf.setImage(with: url)
        cityNameLabel.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplainLabel.text = city.city_explain
        
        guard let keyword = keyword else {return}
        
        cityNameLabel.asColor(targetString: keyword, color: .red)
        cityExplainLabel.asColor(targetString: keyword, color: .orange)
        
    }
    
}
