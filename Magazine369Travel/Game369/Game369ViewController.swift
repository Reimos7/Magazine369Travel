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
    
    @IBOutlet var clapCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // 엔터키 입력시 동작
    @IBAction func enterTextField(_ sender: UITextField) {
       // print(#function)
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
        
        clapCountLabel.numberOfLines = 0
        clapCountLabel.textAlignment = .center
        clapCountLabel.font = .boldSystemFont(ofSize: 20)
        
    }
    
    // 369 계산
    private func calculate369(text textString: String) {
        let clap = "👏"
        var clapCount = 0
        // textView 누적되는것 때매 항상 빈값으로 시작
        resultTextView.text = ""
        
        guard let textInt = Int(textString) else {return}
        
          // 3단계 3,6,9가 포함된 숫자들을 전부 👏로 변경
//        for numInt in 1...textInt {
//            let numString = String(numInt)
//            
//            if numString.contains("3") || numString.contains("6") || numString.contains("9") {
//                resultTextView.text += "\(clap), "
//            } else {
//                resultTextView.text += "\(numInt), "
//            }
//        }
        
        // 옵션) 이제는 3, 6, 9 숫자 만 대체해봅니다 ( 예: 33 은 👏 👏 , 16은 1👏 , 49는 4👏 )
        for numInt in 1...textInt {
            let numString = String(numInt)
           // print("numString: " ,numString)
            var result = ""
            // num은 char
            for num in numString {
                if num == "3" || num == "6" || num == "9" {
                    //print("clap: ",num)
                    result += "\(clap)"
                    // 옵션) 전체 박수의 갯수
                    clapCount += 1
                } else {
                    //print("charNum: ",num)
                    result += String(num)
                }
            }
            resultTextView.text += result + ", "
        }
        // 옵션) 전체 박수의 갯수
        print(clapCount)
        clapCountLabel.text = "숫자 \(textInt)까지 총 박수는\n\(clapCount)번 입니다."
        
//        for numInt in 1...textInt {
//            var numString = String(numInt)
//            
//            result = numString.filter { $0 == "3" || $0 == "6" || $0 == "9"}
//           
//        }
//        print(result)
        
       
        //resultTextView.text = result
    }
}

