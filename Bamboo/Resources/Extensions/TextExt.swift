//
//  TextExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - 텍스트 확장
extension Text {
    
    // MARK: - 폰트 쉽게 적용하기
    func setFont(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Text {
        self
            .font(.system(size: size, weight: weight))
    }
}
