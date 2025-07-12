//
//  369ViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/12/25.
//

import UIKit

class Game369ViewController: UIViewController {
    
    @IBOutlet var numberTextField: UITextField!
    
    @IBOutlet var resultTextView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // 엔터키 입력시 동작
    @IBAction func enterTextField(_ sender: UITextField) {
        print(#function)
        calculate369(text: sender.text!)
    }
    
    private func setupUI() {
        numberTextField.placeholder = "최대 숫자를 입력해주세요"
        numberTextField.borderStyle = .bezel
        
        resultTextView.textColor = .lightGray
        resultTextView.font = .systemFont(ofSize: 20)
        // UITextView사용자 편집 방지
        resultTextView.isEditable = false
        
        resultTextView.text = ""
    }
    
    // 369 계산
    private func calculate369(text textString: String) {
        let clap = "👏"
        
        guard let textInt = Int(textString) else {return}
        
        for numInt in 1...textInt {
            let numString = String(numInt)
            
            if numString.contains("3") || numString.contains("6") || numString.contains("9") {
                resultTextView.text += "\(clap), "
            } else {
                resultTextView.text += "\(numInt), "
            }
        }
    }
}

