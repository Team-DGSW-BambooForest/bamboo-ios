//
//  AuthController.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation

class AuthController {
    let preferences = UserDefaults.standard

    func signIn(token: String, refreshToken: String) {
        preferences.set(true, forKey: "isSignIn")
        preferences.set(token, forKey: "token")
        preferences.set(refreshToken, forKey: "refreshToken")
    }

    func signOut() {
        preferences.set(nil, forKey: "isSignIn")
        preferences.set(nil, forKey: "token")
        preferences.set(nil, forKey: "refreshToken")
    }

    func getToken() -> String {
        return preferences.value(forKey: "token") as? String ?? ""
    }

    func getRefreshToken() -> String {
        return preferences.value(forKey: "refreshToken") as? String ?? ""
    }

    func getIsSignIn() -> Bool {
        return preferences.value(forKey: "isSignIn") as? Bool ?? false
    }

    func tokenRefresh(token: String) {
        preferences.set(nil, forKey: "token")
        preferences.set(token, forKey: "token")
    }
}

extension AuthController {
    static var authController: AuthController!
    static func getInstance() -> AuthController {
        if AuthController.authController == nil {
            AuthController.authController = AuthController()
        }
        return .authController
    }
}
