//
//  TravelAdViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit

class TravelAdViewController: UIViewController {

    @IBOutlet var adTitleLabel: UILabel!
    
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var navigationTItle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupNavigationTitle()
        setupCloseButton()

      
        //view.backgroundColor = .white
        //self.navigationItem.title = "광고 화면"
        // 네비게이션 좌측 상단 x 버튼 설정
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(tappedCloseButton))

        
    }
    
    func setupLabel() {
        adTitleLabel.textAlignment = .center
        adTitleLabel.font = .boldSystemFont(ofSize: 16)
        adTitleLabel.numberOfLines = 3
    }
    
    func setupNavigationTitle() {
        navigationTItle.text = "광고 화면"
        navigationTItle.textAlignment = .center
    }
    func setupCloseButton() {
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .darkGray
    }
    
//    @objc func tappedCloseButton() {
//        dismiss(animated: true)
//    }
    
    // MARK: - dismiss
    @IBAction func tappedCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
