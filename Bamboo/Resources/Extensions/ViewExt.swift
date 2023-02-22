//
//  ViewExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI
import Refresher

// MARK: - View Extension of Bamboo
extension View {
    
    // MARK: - Makes Edge of View Rounder
    @ViewBuilder func roundedEdge(_ radius: CGFloat) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

// MARK: - ScrollView Extension of Bamboo
extension ScrollView {
    
    // MARK: - iOS 14 Refresh Function
    @ViewBuilder func refreshIfPossible(_ data: ListModel) -> some View {
        if #available(iOS 15.0, *) {
            self
                .refreshable {
                    data.refreshData()
                }
        } else {
            self
                .refresher(style: .system) {
                    data.refreshData()
                }
        }
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
