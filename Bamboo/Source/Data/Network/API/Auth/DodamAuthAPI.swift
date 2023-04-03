//
//  DodamAuthAPI.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

import Moya
import Foundation
import CryptoKit

enum DodamAuthAPI {
    case postSignIn(_ request: SignInRequest)
}

extension DodamAuthAPI: TargetType {

    // EndPoint
    var baseURL: URL {
        switch self {
        case .postSignIn:
            return URL(string: Constants.DAUTH_HOST)!
        }
    }

    // 서버의 도메인 뒤에 추가 될 Path (일반적으로 API)
    var path: String {
        switch self {
        case .postSignIn:
            return "/login"
        }
    }

    // HTTP method (GET, POST, …)
    var method: Moya.Method {
        switch self {
        case .postSignIn:
            return .post
        }
    }

    // 테스트용 Mock Data
    var sampleData: Data {
        return Data()
    }

    // 리퀘스트에 사용되는 파라미터 설정
    var task: Task {
        switch self {
        case let .postSignIn(request):
            return .requestParameters(parameters: [
                "id": request.id,
                "pw": SHA512.hash(data: request.pw.data(using: .utf8)!)
                    .compactMap{ String(format: "%02x", $0) }.joined()
            ], encoding: JSONEncoding.default)
        }
    }

    // 허용할 response의 타입
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }

    // HTTP header
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
