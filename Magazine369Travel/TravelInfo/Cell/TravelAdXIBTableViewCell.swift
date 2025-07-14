//
//  TravelXIBTableViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/14/25.
//

/*
 static
 final
 private 접근제어자
 cell 을 enum으로 관리하기
 */

import UIKit

class TravelAdXIBTableViewCell: UITableViewCell {

    @IBOutlet var adTitleBackgroundView: UIView!
    
    @IBOutlet var adTitleLabel: UILabel!
    
    @IBOutlet var adBoxView: UIView!
    
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        selectionStyle = .none
        
        adTitleBackgroundView.clipsToBounds = true
        adTitleBackgroundView.layer.cornerRadius = 14
        
        adTitleLabel.textAlignment = .center
        adTitleLabel.font = .boldSystemFont(ofSize: 18)
        adTitleLabel.numberOfLines = 2
        
        adBoxView.backgroundColor = .white
        adBoxView.clipsToBounds = true
        adBoxView.layer.cornerRadius = 10
        
        adLabel.text = "AD"
        adLabel.textAlignment = .center
    }
    
    
    func configure(title: String, indexPath: Int) {
        adTitleLabel.text = title
        let adBackgroundColor: [UIColor] = [
            .systemPink.withAlphaComponent(0.3),
            .systemGreen.withAlphaComponent(0.3),
            .systemBlue.withAlphaComponent(0.3)
        ]
        
        if indexPath == 4 {
            adTitleBackgroundView.backgroundColor = adBackgroundColor[0]
        } else if indexPath == 8 {
            adTitleBackgroundView.backgroundColor = adBackgroundColor[1]
        } else if indexPath == 13 {
            adTitleBackgroundView.backgroundColor = adBackgroundColor[2]
        }
    }
    
    
    
    
}
