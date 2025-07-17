//
//  UILabel+Extension.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/17/25.
//

import UIKit

extension UILabel {
    // 특정 문자열 색상 변경
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}
