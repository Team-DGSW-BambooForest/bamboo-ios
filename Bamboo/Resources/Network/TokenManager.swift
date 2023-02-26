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

// MARK: - 토큰 매니저
class Token {
    static func get(_ tokenType: TokenType) -> String? {
        return UserDefaults.standard.string(forKey: String(describing: tokenType))
    }

    static func save(_ tokenType: TokenType, _ value: String) {
        UserDefaults.standard.set(value, forKey: String(describing: tokenType))
    }

    static func remove(_ tokenType: TokenType) {
        UserDefaults.standard.removeObject(forKey: String(describing: tokenType))
    }
}
