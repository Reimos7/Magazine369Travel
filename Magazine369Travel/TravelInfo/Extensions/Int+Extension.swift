//
//  Int+Extension.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import Foundation

extension Int {
    // decimal 숫자 3자리마다 , 찍기
    func formatDecimal() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let result = formatter.string(from: NSNumber(integerLiteral: self)) ?? ""
        return result
    }
}
