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
            HStack(spacing: 0) {
                TextField("댓글을 입력하세요", text: $data.commentInput)
                    .font(.system(size: 14, weight: .regular))
                Button(action: {
                    
                }) {
                    Bamboo.send
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Bamboo.makeColor("#AFAFAF"))
                }
                .scaleButton()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Bamboo.makeColor("#E6E6E6"))
            )
            .padding(.horizontal, 14)
            .padding(.top, 21)
            .padding(.bottom, 19)
            .background(Color.white)
        }
        .onAppear { data.loadData(postId) }
    }
}
