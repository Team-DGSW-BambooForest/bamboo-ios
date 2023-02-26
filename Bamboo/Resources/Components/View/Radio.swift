//
//  Radio.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - 라디오 버튼
struct BambooRadio: View {

    @Binding var state: Bool
    let action: () -> Void
    
    init(action: @escaping () -> Void,
         _ state: Binding<Bool>) {
        self.action = action
        self._state = state
    }
    
    var body: some View {
        
        // MARK: - 버튼
        Button(action: {
            withAnimation(.default) {
                action()
            }
        }) {
            ZStack {
                
                // MARK: - 외곽선
                Circle()
                    .strokeBorder(state
                                  ? Bamboo.primary
                                  : LinearGradient(gradient:
                                                    Gradient(colors: [Bamboo.gray]),
                                                   startPoint: .top,
                                                   endPoint: .bottom),
                                  lineWidth: state ? 2 : 1)
                    .frame(width: 18, height: 18)
                
                // MARK: - 내부 원
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
