//
//  TokenRefreshRequest.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

class TokenRefreshRequest: Codable {
    let refreshToken: String

    init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
