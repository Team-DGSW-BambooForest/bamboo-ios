//
//  Constants.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Assets to Enum
enum Bamboo {
    
    // MARK: - Gradient
    static let primary    = LinearGradient(gradient: Gradient(colors: [Bamboo.aqua, Bamboo.green]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing)
    
    // MARK: - Colors
    static let green      = Color("Green")
    static let aqua       = Color("Aqua")
    static let black      = Color("Black")
    static let darkGray   = Color("Dark Gray")
    static let gray       = Color("Gray")
    static let lightGray  = Color("Light Gray")
    
    // MARK: - Images
    static let camera     = Image("Camera")
    static let clear      = Image("Clear")
    static let expand     = Image("Expand")
    static let home       = Image("Home")
    static let image      = Image("Image")
    static let mail       = Image("Mail")
    static let more       = Image("More")
    static let search     = Image("Search")
    static let top        = Image("Top")
    static let unreadMail = Image("UnreadMail")
}

