//
//  ListRouteBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import SwiftUI
import LinkNavigator

struct ListRouteBuilder: RouteBuilder {
    var matchPath: String { "list" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                ListView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
