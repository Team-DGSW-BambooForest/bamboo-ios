//
//  Navigation.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Custom Navigation Bar of Bamboo
struct BambooNavigation<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    /// Variables
    let content: Content

    /// Initializer
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        // MARK: - Main Bar
        HStack {
            
            // MARK: - Dismiss Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("Back")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundColor(Bamboo.black)
            }
            // MARK: - Content
            content
        }
        .padding(.vertical, 8)
    }
}
