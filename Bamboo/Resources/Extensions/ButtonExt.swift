//
//  ButtonExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - 버튼 스타일
extension Button {
    
    // MARK: - 버튼에 애니메이션 적용
    @ViewBuilder func scaleButton() -> some View {
        self
            .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - 버튼 애니메이션 스타일
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.6 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
