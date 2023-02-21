//
//  AppRouterGroup.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import LinkNavigator

struct AppRouterGroup {
    var routers: [RouteBuilder] {
        [
            ListRouteBuilder(),
            PostRouteBuilder(),
            SearchRouteBuilder()
        ]
    }
}
