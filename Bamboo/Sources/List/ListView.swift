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
        VStack {
            ForEach(data.list, id: \.self) { post in
                ProfileCardView(data: post)
            }
            Text("test")
        }
            .onAppear(perform: data.loadData)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(navigator: nil)
    }
}
