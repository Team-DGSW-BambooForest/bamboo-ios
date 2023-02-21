//
//  Haptic.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import UIKit

// MARK: - Haptic Manager
class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

// MARK: - Haptic Maker
public func touch() {
    HapticManager.instance.impact(style: .light)
}
