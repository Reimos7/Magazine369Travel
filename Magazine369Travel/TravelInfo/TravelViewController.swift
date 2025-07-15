//
//  TravelViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit

class TravelViewController: UIViewController {
    
    @IBOutlet var travelImageView: UIImageView!
    
    @IBOutlet var traveltitleLabel: UILabel!
    @IBOutlet var travelDescriptionLabel: UILabel!
    
    @IBOutlet var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "관광지 화면"
        
        setupLabel()
        setupButton()
    }
    
    func setupImage() {
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.clipsToBounds = true
        travelImageView.layer.cornerRadius = 14
    }
    
    func setupLabel() {
        traveltitleLabel.textAlignment = .center
        traveltitleLabel.font = .boldSystemFont(ofSize: 20)
        
        // AutomaticDimension을 위해서 세팅
        travelDescriptionLabel.numberOfLines = 0
        travelDescriptionLabel.textAlignment = .center
        travelDescriptionLabel.font = .boldSystemFont(ofSize: 18)
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
