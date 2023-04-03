//
//  BambooListAPI.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import Foundation
import Moya

enum BambooListAPI {
    case fetchList(_ request: ListRequest)
}

extension BambooListAPI: TargetType {

    // EndPoint
    var baseURL: URL {
        switch self {
        case .fetchList:
            return URL(string: Constants.DEFAULT_HOST + "post")!
        }
    }

    // 서버의 도메인 뒤에 추가 될 Path (일반적으로 API)
    var path: String {
        switch self {
        case .fetchList:
            return "/list"
        }
    }

    // HTTP method (GET, POST, …)
    var method: Moya.Method {
        switch self {
        case .fetchList:
            return .get
        }
    }

    // 테스트용 Mock Data
    var sampleData: Data {
        return Data()
    }

    // 리퀘스트에 사용되는 파라미터 설정
    var task: Task {
        switch self {
        case let .fetchList(request):
            return .requestData(try! JSONEncoder().encode(request))
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
