//
//  ProfileSelectionView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI
import LinkNavigator

// MARK: - 프로필 선택 뷰
struct ProfileSelectionView: View {

    @AppStorage("isAnon", store: .standard) var isAnon: Bool = true
    @State private var anon: Bool = true
    @State private var user: Bool = false
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    private func changeUser(_ to: Bool) {
        isAnon = to
        anon = to
        user = !to
    }
    
    var body: some View {
        VStack(spacing: 12) {
            
            // MARK: - 상단 바
            if UIDevice.current.userInterfaceIdiom == .phone {
                Capsule()
                    .fill(Bamboo.makeColor("#DDDDDD"))
                    .frame(width: 40, height: 4)
            }
            
            Text("내 프로필 선택")
                .foregroundColor(Bamboo.black)
                .setFont(16, .medium)
            
            Rectangle()
                .fill(Bamboo.makeColor("#F2F2F2"))
                .frame(height: 1)
            
            // MARK: - 익명
            HStack(spacing: 12) {
                Bamboo.anon
                    .resizable()
                    .frame(width: 34, height: 34)
                    .background(Bamboo.makeColor("#C8F5CD"))
                    .clipShape(Circle())
                Text("익명이")
                    .setFont(12)
                Spacer()
                BambooRadio(action: {
                    changeUser(true)
                }, $anon)
            }
            
            // MARK: - 도담도담 사용자
            HStack {
                Button(action: action) {
                    HStack(spacing: 12) {
                        Bamboo.plus
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 34, height: 34)
                            .clipShape(Circle())
                        Text("도담도담 계정을 등록하세요!")
                            .setFont(12)
                    }
                }
                Spacer()
                BambooRadio(action: {
                    changeUser(false)
                }, $user)
            }
            .foregroundColor(Bamboo.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .background(Color.white)
    }
}
