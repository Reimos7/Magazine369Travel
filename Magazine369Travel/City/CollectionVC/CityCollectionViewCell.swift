//
//  CityCollectionViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/17/25.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImage: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImage.contentMode = .scaleAspectFill
        //cityImage.backgroundColor = .yellow
        
        cityImage.layer.cornerRadius = cityImage.frame.size.width / 2
        cityImage.clipsToBounds = true
        
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .boldSystemFont(ofSize: 17)
        
        cityExplainLabel.textColor = .lightGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.numberOfLines = 0
        
//        cityImage.layer.cornerRadius = cityImage.frame.height/2
//        cityImage.layer.borderWidth = 5
//        cityImage.clipsToBounds = true
//        cityImage.layer.borderColor = UIColor.blue.cgColor

    }
    
    func configure(city: City) {
        let url = URL(string: city.city_image)
        
        cityImage.kf.setImage(with: url)
        cityNameLabel.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplainLabel.text = city.city_explain
        
    }
}
