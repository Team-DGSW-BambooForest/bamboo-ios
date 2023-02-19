//
//  ProfileSelectionView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI

// MARK: - Profile Selection View
struct ProfileSelectionView: View {
    var body: some View {
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
        }
    }
}
struct ProfileSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectionView()
    }
}
