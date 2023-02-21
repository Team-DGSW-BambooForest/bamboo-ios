//
//  TokenManager.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation

enum TokenType {
    case accessToken
    case refreshToken
}

func getToken(_ tokenType: TokenType) -> String? {
    return UserDefaults.standard.string(forKey: String(describing: tokenType))
}

func saveToken(_ tokenType: TokenType, _ value: String) {
    UserDefaults.standard.set(value, forKey: String(describing: tokenType))
}

func removeToken(_ tokenType: TokenType) {
    UserDefaults.standard.removeObject(forKey: String(describing: tokenType))
}
