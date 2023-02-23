//
//  ProfileView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/24.
//

import SwiftUI

class ProfileModel: ObservableObject {
    @Published var isPresented: Bool = false
}

struct ProfileView: View {
    
    @ObservedObject private var state = ProfileModel()
    let size: CGFloat
    
    var body: some View {
        Button(action: {
            state.isPresented = true
        }) {
            ZStack(alignment: .bottomTrailing) {
                Bamboo.anon
                    .resizable()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                Bamboo.expand
                    .resizable()
                    .foregroundColor(Bamboo.darkGray)
                    .frame(width: 12, height: 12)
                    .background(Bamboo.lightGray)
                    .clipShape(Circle())
            }
        }
        .scaleButton()
    }
}
