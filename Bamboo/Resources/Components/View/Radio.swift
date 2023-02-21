//
//  Radio.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Radio Button of Bamboo
struct BambooRadio: View {
    
    /// Bindings
    @Binding var state: Bool
    
    /// Initializer
    init(_ state: Binding<Bool>) {
        self._state = state
    }
    
    var body: some View {
        
        // MARK: - Main Button
        Button(action: {
            withAnimation(.default) {
                state.toggle()
            }
        }) {
            ZStack {
                
                // MARK: - Outline
                Circle()
                    .strokeBorder(state
                                  ? Bamboo.primary
                                  : LinearGradient(gradient:
                                                    Gradient(colors: [Bamboo.gray]),
                                                   startPoint: .top,
                                                   endPoint: .bottom),
                                  lineWidth: state ? 2 : 1)
                    .frame(width: 18, height: 18)
                
                // MARK: - Inner Circle
                if state {
                    Circle()
                        .fill(Bamboo.primary)
                        .frame(width: 10, height: 10)
                        .transition(.scale)
                }
            }
        }
        .scaleButton()
    }
}