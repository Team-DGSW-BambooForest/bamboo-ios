//
//  Assets.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - Assets to Class
class Bamboo {
    
    // MARK: - Makes Hexcode to UIColor
    public static func hexToColor(hex: String) -> UIColor {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        return UIColor(red: CGFloat(int >> 16) / 255,
                       green: CGFloat(int >> 8 & 0xFF) / 255,
                       blue: CGFloat(int & 0xFF) / 255,
                       alpha: 1)
    }
    
    // MARK: - Makes Two Hexcodes to Color
    public static func makeColor(_ light: String, dark: String? = nil) -> Color {
        let lightColor = hexToColor(hex: light)
        if dark == nil {
            return Color(lightColor)
        } else {
            let darkColor = hexToColor(hex: dark!)
            return Color(UIColor { $0.userInterfaceStyle == .dark ? darkColor : lightColor })
        }
    }
    
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
    
    // MARK: - Icons
    static let camera     = Image("Camera")
    static let clear      = Image("Clear")
    static let expand     = Image("Expand")
    static let home       = Image("Home")
    static let image      = Image("Image")
    static let mail       = Image("Mail")
    static let more       = Image("More")
    static let plus       = Image("Plus")
    static let search     = Image("Search")
    static let top        = Image("Top")
    static let unreadMail = Image("UnreadMail")
    
    // MARK: - Images
    static let anon       = Image("Anon")
    static let logo       = Image("Logo")
}

