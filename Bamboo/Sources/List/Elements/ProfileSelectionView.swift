//
//  ProfileSelectionView.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI

// MARK: - Profile Selection View
struct ProfileSelectionView: View {
    
    @AppStorage("isAnon", store: .standard) var isAnon: Bool = true
    @StateObject private var state = ProfileModel()
    @State private var draggedOffset: CGFloat = 0
    @State private var previousDragValue: DragGesture.Value?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                
                Capsule()
                    .fill(Bamboo.makeColor("#DDDDDD"))
                    .frame(width: 40, height: 4)
                
                Text("내 프로필 선택")
                    .foregroundColor(Bamboo.black)
                    .setFont(16, .medium)
                
                Rectangle()
                    .fill(Bamboo.makeColor("#F2F2F2"))
                    .frame(height: 1)
                
                HStack(spacing: 12) {
                    Bamboo.anon
                        .resizable()
                        .frame(width: 34, height: 34)
                        .background(Bamboo.makeColor("#C8F5CD"))
                        .clipShape(Circle())
                    Text("익명이")
                        .setFont(12)
                    Spacer()
                    BambooRadio($isAnon)
                }
                
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(Color.white)
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        guard state.isPresented else { return }
                        
                        let offsetY = value.translation.height
                        self.draggedOffset = offsetY
                        
                        if let previousValue = self.previousDragValue {
                            let previousOffsetY = previousValue.translation.height
                            let timeDiff = Double(value.time.timeIntervalSince(previousValue.time))
                            let heightDiff = Double(offsetY - previousOffsetY)
                            let velocityY = heightDiff / timeDiff
                            if velocityY > 1400 {
                                state.isPresented = false
                                // onDismiss
                                return
                            }
                        }
                        self.previousDragValue = value
                        
                    })
                    .onEnded({ (value) in
                        let offsetY = value.translation.height
                        if offsetY > geometry.size.height {
                            state.isPresented = false
                            // onDismiss
                        }
                        self.draggedOffset = 0
                    })
            )
        }
    }
}

struct ProfileSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectionView()
    }
}
