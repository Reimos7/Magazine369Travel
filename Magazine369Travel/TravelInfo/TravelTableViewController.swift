//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/12/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var travelInfo = TravelInfo()
    //var adCellBackgroundCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 상세 정보"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelInfoCell = travelInfo.travel[indexPath.row]
        
        // 광고 셀 유무에 따라
        
        // 광고 셀
        if let ad = travelInfoCell.ad, ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelAdCell", for: indexPath) as! TravelAdTableViewCell
            let adBackgroundColor: [UIColor] = [
                .systemPink.withAlphaComponent(0.3),
                .systemGreen.withAlphaComponent(0.3),
                .systemBlue.withAlphaComponent(0.3)
            ]
            cell.adTitleBackgroundView.clipsToBounds = true
            cell.adTitleBackgroundView.layer.cornerRadius = 14
            
            //print(adBackgroundColor.count)
            //print(indexPath.row, "인덱스 로우")
            cell.adTitleLabel.text = travelInfoCell.title
            cell.adTitleLabel.textAlignment = .center
            cell.adTitleLabel.font = .boldSystemFont(ofSize: 18)
            cell.adTitleLabel.numberOfLines = 2
//            indexPath.row = 0 % 3 == [0]  1 % 3 == [1] 2 % 3 == [2]
            // 4, 8, 13
            //cell.backgroundColor = adBackgroundColor[indexPath.row % adBackgroundColor.count]
            //adCellBackgroundCount += 1
            // var titleBackgroundColor = cell.adTitleBackgroundView.backgroundColor
            
            if indexPath.row == 4 {
                cell.adTitleBackgroundView.backgroundColor = adBackgroundColor[0]
            } else if indexPath.row == 8 {
                cell.adTitleBackgroundView.backgroundColor = adBackgroundColor[1]
            } else if indexPath.row == 13 {
                cell.adTitleBackgroundView.backgroundColor = adBackgroundColor[2]
            }
            
            cell.adBoxView.backgroundColor = .white
            cell.adBoxView.clipsToBounds = true
            cell.adBoxView.layer.cornerRadius = 10
            
            cell.adLabel.text = "AD"
            cell.adLabel.textAlignment = .center
            
            
            return cell
            
        } else {
            // 광고셀이 아닌 여행 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
            
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
            
            // 3자리 마다 , 찍기
            let formattedSave = formatNumber(save)
            
            cell.titleLabel.text = travelInfoCell.title
            cell.titleLabel.textAlignment = .left
            cell.titleLabel.font = .boldSystemFont(ofSize: 20)
            cell.titleLabel.numberOfLines = 2
            
            cell.descriptionLabel.isHidden = false
            cell.descriptionLabel.text = description
            cell.descriptionLabel.textAlignment = .left
            cell.descriptionLabel.textColor = .darkGray
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
            // 버튼 클릭을 위한 태그 설정
            cell.likeButton.tag = indexPath.row
            // 버튼 클릭 이벤트
            cell.likeButton.addTarget(self, action: #selector(tappedLikeButton), for: .touchUpInside)
            
            // 별 넣기
            setStarUI(label: cell.starLabel, grade: grade)
            
            cell.gradeSaveLabel.isEnabled = false
            cell.gradeSaveLabel.text = "(\(grade)) · 저장 \(formattedSave)"
            cell.gradeSaveLabel.font = .systemFont(ofSize: 14)
            cell.gradeSaveLabel.textColor = .lightGray
            //print("원래 값: ",travelInfoCell.like)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 광고 셀이면 높이 100
        if let travelInfoCellAd = travelInfo.travel[indexPath.row].ad, travelInfoCellAd {
            return 100
        }
        // 일반 셀이면 200
        return 200
        
    }
    
    // 좋아요 버튼 상태 변경
    @objc func tappedLikeButton(_ sender: UIButton) {
        //print("변경 전:", travelInfo.travel[sender.tag].like)
        var travelInfoTag = travelInfo.travel[sender.tag]
        travelInfoTag.like?.toggle()
        travelInfo.travel[sender.tag] = travelInfoTag
        //print("변경 후:", travelInfo.travel[sender.tag].like)
        tableView.reloadData()
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
