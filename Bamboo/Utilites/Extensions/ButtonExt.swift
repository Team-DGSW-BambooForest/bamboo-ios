//
//  ButtonExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Button Style
extension Button {
    
    // MARK: - Scale Animation for Button
    @ViewBuilder func scaleButton() -> some View {
        self
            .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - Scale Style for Button
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.6 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
