//
//  Button.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - 커스텀 버튼
struct BambooButton: View {
 
    let action: () -> Void
    let text: String
    var disabled: Bool = false
    var isSecondary: Bool = false

    init(action: @escaping () -> Void,
         text: String,
         disabled: Bool = false,
         isSecondary: Bool = false)
    {
        self.action = action
        self.text = text
        self.disabled = disabled
        self.isSecondary = isSecondary
    }
    
    var body: some View {
        
        // MARK: - 버튼
        Button(action: action) {
            Text(text)
                .setFont(14)
                .foregroundColor(isSecondary
                                 ? Bamboo.gray
                                 : .white)
                .padding(.vertical, 7)
                .padding(.horizontal, 17)
                .background(isSecondary
                            ? AnyView(Color.white)    /// Secondary Color
                            : !disabled
                            ? AnyView(Bamboo.primary) /// Primary Color
                            : AnyView(Bamboo.gray))   /// Disabled Color
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Bamboo.lightGray,
                                      lineWidth: isSecondary ? 1 : 0)
                )
                .roundedEdge(10)
        }
        .scaleButton()
        .disabled(disabled)
    }
}

// MARK: - 확장
extension BambooButton {
    
    // MARK: - 버튼 비활성화
    func disabled(_ disabled: Bool) -> BambooButton {
        BambooButton(action: self.action,
                     text: self.text,
                     disabled: disabled,
                     isSecondary: self.isSecondary)
    }
    
    // MARK: - 취소 버튼 스타일
    func secondary() -> BambooButton {
        BambooButton(action: self.action,
                     text: self.text,
                     disabled: self.disabled,
                     isSecondary: true)
    }
}
