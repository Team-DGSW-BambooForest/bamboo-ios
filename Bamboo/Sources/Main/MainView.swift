//
//  MainView.swift
//  Bamboo
//
//  Created by Mercen on 2022/11/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            BambooNavigation {
                Text("aa")
            }
            BambooButton(action: {
                
            }, text: "Hello")
            BambooButton(action: {
                
            }, text: "Hello")
            .secondary()
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
