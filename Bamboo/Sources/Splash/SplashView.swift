//
//  SplashView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/26.
//

import SwiftUI
import LinkNavigator

// MARK: - 스플래시 뷰
struct SplashView: View {
    
    let navigator: LinkNavigatorType?
    
    var body: some View {
        
        // MARK: - 로고
        Bamboo.bamboo
            .renderingMode(.template)
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Bamboo.primary.ignoresSafeArea())
            .preferredColorScheme(.dark)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    navigator!.replace(paths: ["list"], items: [:], isAnimated: true)
                }
            }
    }
}
