//
//  ListView.swift
//  Bamboo
//
//  Created by Mercen on 2022/11/29.
//

import SwiftUI
import LinkNavigator

struct ListView: View {
    
    @ObservedObject private var data = ListModel()
    let navigator: LinkNavigatorType?
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(data.list, id: \.self) { post in
                    VStack(alignment: .leading, spacing: 12) {
                        ProfileCardView(data: post)
                        Text(post.content)
                            .setFont(14)
                            .foregroundColor(Bamboo.black)
                    }
                }
            }
        }
        .onAppear(perform: data.loadData)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(navigator: nil)
    }
}
