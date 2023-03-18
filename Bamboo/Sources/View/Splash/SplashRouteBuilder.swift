//
//  SplashRouteBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/26.
//

import SwiftUI
import LinkNavigator

struct SplashRouteBuilder: RouteBuilder {
    var matchPath: String { "splash" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                SplashView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
