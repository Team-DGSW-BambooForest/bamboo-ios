//
//  ProfileCardView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import SwiftUI

// MARK: - 프로필 카드 뷰
struct ProfileCardView: View {

    let data: Post?
    
    // MARK: - 날짜 포맷
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: data?.createdAt ?? Date())
    }
    
    var body: some View {
        HStack(spacing: 12) {
            
            // MARK: - 프로필 이미지
            BambooImage(data?.profileImage ?? "")
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            // MARK: - 이름과 날짜
            VStack(alignment: .leading, spacing: 3) {
                Text(data?.author ?? "")
                    .setFont(14, .medium)
                    .foregroundColor(Bamboo.black)
                Text(formattedDate)
                    .setFont(12)
                    .foregroundColor(Bamboo.gray)
            }
            Spacer()
        }
    }
}
