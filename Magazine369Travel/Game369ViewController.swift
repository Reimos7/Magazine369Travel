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
    
    private func setupUI() {
        numberTextField.placeholder = "최대 숫자를 입력해주세요"
        numberTextField.borderStyle = .bezel
        
        resultTextView.textColor = .lightGray
        resultTextView.font = .systemFont(ofSize: 20)
        
        resultTextView.text = ""
        for i in 1...100 {
            resultTextView.text += "\(i), "
            
        }
        
    }

}
