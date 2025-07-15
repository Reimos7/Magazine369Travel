//
//  TravelAdViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit

class TravelAdViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    var mainLabelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "광고 화면"
        
        // 네비게이션 좌측 상단 x 버튼 설정
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        mainLabel.text = mainLabelText
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 16)
        mainLabel.numberOfLines = 0
    }
    
    // MARK: - dismiss
    @objc func tappedCloseButton() {
        dismiss(animated: true)
    }
}
