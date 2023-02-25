//
//  ProfileCardView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import SwiftUI

struct ProfileCardView: View {
    
    /// Variables
    let data: Post?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: data?.createdAt ?? Date())
    }
    
    var body: some View {
        HStack(spacing: 12) {
            BambooImage(data?.profileImage ?? "")
                .frame(width: 40, height: 40)
                .clipShape(Circle())
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
