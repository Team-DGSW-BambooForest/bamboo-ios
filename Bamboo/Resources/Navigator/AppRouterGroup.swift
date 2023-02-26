//
//  AppRouterGroup.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import LinkNavigator

// MARK: - LinkNavigator 라우터 그룹
struct AppRouterGroup {
    var routers: [RouteBuilder] {
        
        // MARK: - 라우터 만들때마다 여기에 추가
        [
            ListRouteBuilder(),
            PostRouteBuilder(),
            SearchRouteBuilder(),
            LoginRouteBuilder()
        ]
    }
}
