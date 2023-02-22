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
        BambooNavigation {
            ProfileCardView(data: data.post)
        }
        Text(data.post?.content ?? "")
            .onAppear { data.loadData(postId) }
    }
}

