//
//  MainRouteBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import LinkNavigator
import SwiftUI

struct MainRouteBuilder: RouteBuilder {
    var matchPath: String { "main" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                MainView(navigator: navigator)
            }
        }
    }
}
