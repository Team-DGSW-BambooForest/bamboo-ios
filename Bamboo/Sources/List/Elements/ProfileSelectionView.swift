//
//  ProfileSelectionView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI

// MARK: - Profile Selection View
struct ProfileSelectionView: View {
    
    @AppStorage("isAnon", store: .standard) var isAnon: Bool = true
    
    var body: some View {
        Color.black.opacity(0.2).ignoresSafeArea()
        VStack(spacing: 12) {
            
            Capsule()
                .fill(Bamboo.makeColor("#DDDDDD"))
                .frame(width: 40, height: 4)
            
            Text("내 프로필 선택")
                .foregroundColor(Bamboo.black)
                .setFont(16, .medium)
            
            Rectangle()
                .fill(Bamboo.makeColor("#F2F2F2"))
                .frame(height: 1)
            
            HStack(spacing: 12) {
                Bamboo.anon
                    .resizable()
                    .frame(width: 34, height: 34)
                    .background(Bamboo.makeColor("#C8F5CD"))
                    .clipShape(Circle())
                Text("익명이")
                    .setFont(12)
                Spacer()
                BambooRadio($isAnon)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .background(Color.white)
    }
}

struct ProfileSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectionView()
    }
}