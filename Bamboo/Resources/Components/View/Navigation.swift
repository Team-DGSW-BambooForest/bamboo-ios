//
//  Navigation.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - 커스텀 네비게이션 바
struct BambooNavigation<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        // MARK: - 네비게이션 바
        HStack {
            
            // MARK: - 닫기 버튼
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Bamboo.back
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundColor(Bamboo.black)
            }
            // MARK: - 뷰
            content
        }
        .padding(.vertical, 8)
    }
}
