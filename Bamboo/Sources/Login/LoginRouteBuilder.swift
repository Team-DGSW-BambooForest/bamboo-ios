//
//  LoginRouteBuilder.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import LinkNavigator
import SwiftUI

struct LoginRouteBuilder: RouteBuilder {
    var matchPath: String { "login" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                LoginView(navigator: navigator)
            }
        }
    }
}
