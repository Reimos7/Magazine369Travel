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
        
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .boldSystemFont(ofSize: 17)
        
        cityExplainLabel.textColor = .lightGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.numberOfLines = 0
        
    }
    
    // 뷰컨트롤러에서 프레임이 결정이 되는 곳 
    // 그래서, 버튼을 넓이 기준으로 깍는 것이 가능(넓이 프레임이 결정되니까)
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cityImage.clipsToBounds = true
        cityImage.layer.cornerRadius = cityImage.frame.size.width / 2
    }
    
    func configure(city: City) {
        let url = URL(string: city.city_image)
        
        cityImage.kf.setImage(with: url)
        cityNameLabel.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplainLabel.text = city.city_explain
        
    }
}
