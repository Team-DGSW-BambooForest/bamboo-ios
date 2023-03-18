//
//  ListView.swift
//  Bamboo
//
//  Created by Mercen on 2022/11/29.
//

import SwiftUI
import LinkNavigator

// MARK: - 리스트 뷰
struct ListView: View {
    
    @ObservedObject private var state = ListState()
    @State var selection: Bool = false
    let navigator: LinkNavigatorType?
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - 상단 바
            HStack(spacing: 15) {
                
                // MARK: - 대대숲 로고
                ZStack(alignment: .leading) {
                    Bamboo.logo
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text("대대숲")
                        .setFont(20, .medium)
                        .foregroundColor(.black)
                        .padding(.leading, 23.5)
                }
                Spacer()
                
                // MARK: - 검색 버튼
                Button(action: {
                    navigator!.next(paths: ["search"], items: [:], isAnimated: true)
                }) {
                    Bamboo.search
                }
                .padding(.trailing, 5)
                
                // MARK: - 프로필 선택 버튼
                ProfileView(size: 34, navigator: navigator)
            }
            .padding(.top, 8)
            .padding([.horizontal, .bottom], 14)
            
            // MARK: - 리스트
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(state.list, id: \.self) { post in
                        
                        // MARK: - 리스트 셀
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
                        .transition(.opacity)
                    }
                    
                    // MARK: - 페이징을 위한 숨은 뷰
                    Rectangle()
                        .hidden()
                        .onAppear { state.loadData() }
                }
                .padding(.top, 8)
            }
            .refreshable {
                state.refreshData()
            }
            .background(Bamboo.makeColor("#F2F4F9"))
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(navigator: nil)
    }
}
