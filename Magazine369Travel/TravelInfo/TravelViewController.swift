//
//  TravelViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit
import Kingfisher

class TravelViewController: UIViewController {
    
    @IBOutlet var travelImageView: UIImageView!
    
    @IBOutlet var traveltitleLabel: UILabel!
    @IBOutlet var travelDescriptionLabel: UILabel!
    
    @IBOutlet var popButton: UIButton!
    // 이전 화면에서 식판 받기 (데이터)
    var travelInfomation: Travel = Travel(title: "", description: nil, travel_image: nil, grade: nil, save: nil, ad: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "관광지 화면"
        setupImage()
        setupLabel()
        setupButton()
    }
    
    func setupImage() {
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.clipsToBounds = true
        travelImageView.layer.cornerRadius = 14
        
        guard let travelImageURL = travelInfomation.travel_image,
              let url = URL(string: travelImageURL) else {
            travelImageView.image = nil
            return
        }
        
        travelImageView.kf.setImage(with: url)
        
    }
    
    func setupLabel() {
        traveltitleLabel.textAlignment = .center
        traveltitleLabel.font = .boldSystemFont(ofSize: 40)
        
        traveltitleLabel.text = travelInfomation.title
        
        // AutomaticDimension을 위해서 세팅
        travelDescriptionLabel.numberOfLines = 0
        travelDescriptionLabel.textAlignment = .center
        travelDescriptionLabel.font = .boldSystemFont(ofSize: 30)
        
        travelDescriptionLabel.text = travelInfomation.description
    }
    
    func setupButton() {
        popButton.setTitle("다른 광광지 보러가기", for: .normal)
        popButton.setTitleColor(.white, for: .normal)
        
        popButton.clipsToBounds = true
        popButton.layer.cornerRadius = 14
        
        popButton.backgroundColor =  UIColor(red: 135/255.0, green: 186/255.0, blue: 234/255.0, alpha: 1.0)
        
    }
    
    // MARK: - pop으로 뒤로 가기
    @IBAction func tappedPopButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
   
}
