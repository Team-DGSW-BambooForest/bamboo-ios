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
                PostView(postId: items.getValue(key: "postId") ?? "", navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}

extension Dictionary where Key == String, Value == String {
    fileprivate func getValue(key: String) -> String? {
        first(where: { $0.key == key })?.value as? String
    }
}
