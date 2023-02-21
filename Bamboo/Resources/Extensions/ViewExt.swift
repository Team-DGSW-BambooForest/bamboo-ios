//
//  ViewExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

// MARK: - View Extension of Bamboo
extension View {
    
    // MARK: - Makes Edge of View Rounder
    @ViewBuilder func roundedEdge(_ radius: CGFloat) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

// MARK: - Function Extensions of UINavigationController
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
