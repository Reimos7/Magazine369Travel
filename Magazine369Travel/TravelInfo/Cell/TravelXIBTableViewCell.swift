//
//  TravelAdXIBTableViewCell.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/14/25.
//

import UIKit

class TravelXIBTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    @IBOutlet var gradeSaveLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var travelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        selectionStyle = .none
        
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 2
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 2
        
        travelImage.contentMode = .scaleAspectFill
        travelImage.clipsToBounds = true
        travelImage.layer.cornerRadius = 10
        
        likeButton.tintColor = .white
        
        gradeSaveLabel.font = .systemFont(ofSize: 14)
        gradeSaveLabel.textColor = .lightGray
        //print("원래 값: ",travelInfoCell.like)
        // 별 라벨 기본 설정
        starLabel.textColor = .yellow
    }
    
    func configure(travelInfoCell: Travel, indexPath: Int, title: String) {
        
        titleLabel.text = travelInfoCell.title
        
        if let description = travelInfoCell.description {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
        
        if let imageUrl = travelInfoCell.travel_image,
           let url = URL(string: imageUrl) {
            travelImage.isHidden = false
            travelImage.kf.setImage(with: url)
            
        } else {
            travelImage.image = UIImage(systemName: "questionmark")
            travelImage.tintColor = .black
            travelImage.backgroundColor = .darkGray
            travelImage.isHidden = true
        }
        
        if let like = travelInfoCell.like {
            let likeBtn = !like ? "heart" : "heart.fill"
            likeButton.isHidden = false
            likeButton.setImage(UIImage(systemName: likeBtn), for: .normal)
            // 버튼 클릭을 위한 태그 설정
            likeButton.tag = indexPath
           
        } else {
            likeButton.isHidden = true
        }
        
        guard let grade = travelInfoCell.grade else {
            return starLabel.isHidden = true
        }
        
        starLabel.isHidden = false
        // 별 넣기
        setStarUI(label: starLabel, grade: grade)
        
        if let save = travelInfoCell.save {
            gradeSaveLabel.isHidden = false
            // 3자리 마다 , 찍기
            let formattedSave = formatNumber(save)
            gradeSaveLabel.isEnabled = false
            gradeSaveLabel.text = "(\(grade)) · 저장 \(formattedSave)"
        } else {
            gradeSaveLabel.isHidden = true
        }
        
    }
    // MARK: - SFSymbol 별 이미지를 grade에 맞춰 별 모양대로 반올림 계산
    private func setStarUI(label: UILabel, grade: Double) {
        let starImage = UIImage(systemName: "star")!
        let starFillImage = UIImage(systemName: "star.fill")!
        // UILabel에 이미지 넣기 위해 설정
        let result = NSMutableAttributedString()
        // 평점 반올림 처리
        let roundedGrade = Int(grade.rounded())
        // 꽉찬 별
        let star = roundedGrade
        // 빈 별
        let emptyStar = 5 - roundedGrade
        
        // 꽉찬 별
        for _ in 0..<star {
            // 이미지를 텍스트처럼
            let imageAttachment = NSTextAttachment()
            // 색상 적용을 위해 템플릿으로
            imageAttachment.image = starFillImage.withRenderingMode(.alwaysTemplate)
            result.append(NSAttributedString(attachment: imageAttachment))
            imageAttachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
            //label.tintColor = .yellow
        }
        
        // 빈 별
        for _ in 0..<emptyStar {
            // 이미지를 텍스트처럼
            let imageAttachment = NSTextAttachment()
            // 색상 적용을 위해 템플릿으로
            imageAttachment.image = starImage.withRenderingMode(.alwaysTemplate)
            result.append(NSAttributedString(attachment: imageAttachment))
            imageAttachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
            //label.textColor = .yellow
        }
        
        // SFSymbol을 label에 넣음
        label.attributedText = result
        label.textColor = .yellow
    }
    
    // 숫자 3자리마다 , 찍기
    private func formatNumber(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let result = formatter.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
    
}
