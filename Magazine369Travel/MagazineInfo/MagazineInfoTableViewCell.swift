//
//  TravelTableViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/11/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.clipsToBounds = true
        cardImageView.layer.cornerRadius = 14
        
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .left
        
        subtitleLabel.textColor = .darkGray
        subtitleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        subtitleLabel.textAlignment = .left
        
        dateLabel.textColor = .darkGray
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.textAlignment = .right
    }
}
