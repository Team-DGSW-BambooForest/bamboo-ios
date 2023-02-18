//
//  Button.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Large Button of Bamboo
struct BambooButton: View {
    
    /// Variables
    let action: () -> Void
    let text: String
    var disabled: Bool = false
    var isSecondary: Bool = false
    
    /// Initializer
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
        
        // MARK: - Main Button
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
                /// Makes Stroke if Secondary Button
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Bamboo.lightGray,
                                      lineWidth: isSecondary ? 1 : 0)
                )
        }
        .roundedEdge(10)
        .disabled(disabled)
    }
}

// MARK: - Function Extensions of BambooButton
extension BambooButton {
    
    // MARK: - Disabled Function
    func disabled(_ disabled: Bool) -> BambooButton {
        BambooButton(action: self.action,
                     text: self.text,
                     disabled: disabled,
                     isSecondary: self.isSecondary)
    }
    
    // MARK: - Secondary Button Function
    func secondary() -> BambooButton {
        BambooButton(action: self.action,
                     text: self.text,
                     disabled: self.disabled,
                     isSecondary: true)
    }
}
