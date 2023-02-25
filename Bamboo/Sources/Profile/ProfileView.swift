//
//  ProfileView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/24.
//

import SwiftUI
import PartialSheet

// MARK: - Profile View
struct ProfileView: View {

    /// Variables
    @State private var isPresented: Bool = false
    let size: CGFloat
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
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
        .partialSheet(isPresented: $isPresented,
                      iPhoneStyle: PSIphoneStyle.init(background: .solid(.white),
                                                      handleBarStyle: .none,
                                                      cover: .enabled(.black.opacity(0.2)),
                                                      cornerRadius: 15))
        {
            ProfileSelectionView()
        }
    }
}
