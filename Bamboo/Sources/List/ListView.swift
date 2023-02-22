//
//  ListView.swift
//  Bamboo
//
//  Created by Mercen on 2022/11/29.
//

import SwiftUI
import LinkNavigator
import Refresher

struct ListView: View {
    
    @ObservedObject private var data = ListModel()
    let navigator: LinkNavigatorType?
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Bar
            HStack(spacing: 15) {
                ZStack(alignment: .leading) {
                    Bamboo.logo
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text("대대숲")
                        .setFont(20, .medium)
                        .padding(.leading, 23.5)
                }
                Spacer()
                Button(action: {
                    navigator!.next(paths: ["search"], items: [:], isAnimated: true)
                }) {
                    Bamboo.search
                }
                .padding(.trailing, 5)
            }
            .padding(.top, 8)
            .padding([.horizontal, .bottom], 14)
            
            // MARK: - List Items
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(data.list, id: \.self) { post in
                        
                        // MARK: - List Item
                        Button(action: {
                            navigator!.next(paths: ["post"],
                                            items: ["postId": String(post.postId)],
                                            isAnimated: true)
                        }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    ProfileCardView(data: post)
                                    Text(post.content)
                                        .setFont(14)
                                        .foregroundColor(Bamboo.black)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                        }
                    }
                    Rectangle()
                        .hidden()
                        .onAppear(perform: data.loadData)
                }
                .padding(.top, 8)
            }
            .refreshIfPossible(data)
            .background(Bamboo.makeColor("#F2F4F9"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(navigator: nil)
    }
}
