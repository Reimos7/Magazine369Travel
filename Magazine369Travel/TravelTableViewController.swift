//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/12/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let travelInfo = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 상세 정보"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        let travelInfoCell = travelInfo.travel[indexPath.row]
        
        
        guard let description = travelInfoCell.description else {
            cell.descriptionLabel.isHidden = true
            return cell
        }
        
        guard let imageUrl = travelInfoCell.travel_image else {
            print("gg")
            cell.travelImage.image = UIImage(systemName: "questionmark")
            cell.travelImage.tintColor = .black
            cell.travelImage.backgroundColor = .darkGray
            cell.travelImage.isHidden = true
            return cell
        }
        guard let url = URL(string: imageUrl) else {
            cell.travelImage.image = UIImage(systemName: "questionmark")
            cell.travelImage.tintColor = .black
            cell.travelImage.backgroundColor = .darkGray
            return cell
        }
        
        guard let like = travelInfoCell.like else {
            cell.likeButton.isHidden = true
            return cell
        }
        
        guard let grade = travelInfoCell.grade else {
            cell.starLabel.isHidden = true
            return cell
        }
        
        guard let save = travelInfoCell.save else {
            cell.gradeSaveLabel.isHidden = true
            return cell
        }
        
        cell.titleLabel.text = travelInfoCell.title
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.font = .boldSystemFont(ofSize: 17)
        cell.titleLabel.numberOfLines = 2
        
        cell.descriptionLabel.isHidden = false
        cell.descriptionLabel.text = description
        cell.descriptionLabel.textAlignment = .left
        cell.descriptionLabel.textColor = .lightGray
        cell.descriptionLabel.font = .systemFont(ofSize: 16)
        cell.descriptionLabel.numberOfLines = 2
        
        cell.travelImage.isHidden = false
        cell.travelImage.kf.setImage(with: url)
        cell.travelImage.contentMode = .scaleAspectFill
        cell.travelImage.clipsToBounds = true
        cell.travelImage.layer.cornerRadius = 10
        
        let likeBtn = !like ? "heart" : "heart.fill"
        cell.likeButton.isHidden = false
        cell.likeButton.setImage(UIImage(systemName: likeBtn), for: .normal)
        cell.likeButton.tintColor = .white
        
        // 별 넣기
        setStarUI(label: cell.starLabel, grade: grade)
        
        cell.gradeSaveLabel.isEnabled = false
        cell.gradeSaveLabel.text = "(\(grade)) · 저장 \(save)"
        cell.gradeSaveLabel.font = .systemFont(ofSize: 14)
        cell.gradeSaveLabel.textColor = .lightGray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
}
