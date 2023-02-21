//
//  AppMain.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import SwiftUI
import LinkNavigator

@main
struct AppMain: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var navigator: LinkNavigator {
        appDelegate.navigator
    }
    
    var body: some Scene {
        WindowGroup {
            navigator
                .launch(paths: ["list"], items: [:])
                .onOpenURL { url in
                    
                }
        }
    }
}
