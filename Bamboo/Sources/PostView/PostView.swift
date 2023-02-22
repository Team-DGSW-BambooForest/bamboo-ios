//
//  PostView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI
import LinkNavigator

struct PostView: View {
    
    @ObservedObject private var data = PostModel()
    @State var postId: String
    
    /// Variables
    let navigator: LinkNavigatorType?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 14) {
                BambooNavigation {
                    ProfileCardView(data: data.post)
                }
                Text(data.post?.content ?? "")
                    .setFont(14)
                    .foregroundColor(Bamboo.black)
            }
            .padding(.bottom, 16)
            .padding(.horizontal, 14)
            Rectangle()
                .fill(Bamboo.makeColor("#F2F2F2"))
                .frame(height: 1)
            ScrollView {
                
            }
        }
        .onAppear { data.loadData(postId) }
    }
}
