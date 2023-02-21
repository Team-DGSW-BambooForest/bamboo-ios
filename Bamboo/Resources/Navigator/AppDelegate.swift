//
//  AppDelegate.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import SwiftUI
import LinkNavigator

final class AppDelegate: NSObject {
    var navigator: LinkNavigator {
        LinkNavigator(dependency: AppDependency(), builders: AppRouterGroup().routers)
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        true
    }
}
