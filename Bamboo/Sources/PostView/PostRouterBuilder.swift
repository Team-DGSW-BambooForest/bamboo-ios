//
//  PostRouterBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI
import LinkNavigator

struct PostRouteBuilder: RouteBuilder {
    var matchPath: String { "post" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                PostView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
