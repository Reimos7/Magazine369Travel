//
//  CityDetailViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/16/25.
//

import UIKit
import Kingfisher

// 셀 선택시 나오는 화면
class CityDetailViewController: UIViewController {

    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    @IBOutlet var closeButton: UIButton!
    
    var image: String?
    var name: String?
    var explain: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
        setupLabel()
        setupButton()
        closeButton.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
    }
    
    @objc
    func tappedCloseButton() {
        dismiss(animated: true)
        
    }
    
    func setupImage() {
        cityImage.contentMode = .scaleAspectFill
        cityImage.clipsToBounds = true
        cityImage.layer.cornerRadius = 20
        cityImage.layer.borderWidth = 5
        cityImage.layer.borderColor = UIColor.clear.cgColor
        
        guard let imageURL = image,
              let url = URL(string: imageURL) else { return
        }
        
        cityImage.kf.setImage(with: url)
    }
    
    func setupLabel() {
        cityNameLabel.font = .boldSystemFont(ofSize: 30)
        cityNameLabel.textAlignment = .center
        
        cityNameLabel.text = name
        
        cityExplainLabel.font = .boldSystemFont(ofSize: 20)
        cityExplainLabel.textAlignment = .center
        
        cityExplainLabel.text = explain
    }

    func setupButton() {
        closeButton.setTitle("닫기", for: .normal)
        closeButton.setTitleColor(.red, for: .normal)
        closeButton.backgroundColor = .green
    }

}
