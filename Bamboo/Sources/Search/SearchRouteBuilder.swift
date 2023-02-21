//
//  SearchRouteBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import LinkNavigator
import SwiftUI

struct SearchRouteBuilder: RouteBuilder {
    var matchPath: String { "search" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                SearchView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
