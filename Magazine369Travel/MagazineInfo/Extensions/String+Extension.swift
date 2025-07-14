//
//  String+Extension.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import Foundation

extension String {
    // DateFormatter를 통한 날짜 형식 함수 구현
    func formattedMagazineDate() -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyMMdd"  // 입력 문자열 형식 설정
       
       if let date = formatter.date(from: self) {
           formatter.dateFormat = "yy년 MM월 dd일"  // 출력 형식 설정
           return formatter.string(from: date)  // 변환된 문자열 반환
       }
        return ""  // 변환 실패 시 빈 문자열 반환
       
   }
}
