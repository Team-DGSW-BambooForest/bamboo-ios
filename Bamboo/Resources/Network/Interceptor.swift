//
//  Interceptor.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation
import Alamofire

struct InterceptorData: Codable {
    let accessToken: String
}

// MARK: - Alamofire Interceptor
final class Interceptor: RequestInterceptor {
    
    // MARK: - Request Adapter
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(baseAPI) == true,
              let accessToken = Token.get(.accessToken) else {
                  completion(.success(urlRequest))
                  return
              }
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        urlRequest.timeoutInterval = 5
        completion(.success(urlRequest))
    }
    
    // MARK: - Token Refresher
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        AF.request("\(userAPI)/token/refresh",
                   method: .post,
                   parameters: ["refreshToken": "Bearer \(Token.get(.refreshToken)!)"],
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
            case .success:
                let decoder: JSONDecoder = JSONDecoder()
                guard let value = response.value else { return }
                guard let result = try? decoder.decode(InterceptorData.self, from: value) else { return }
                Token.save(.accessToken, result.accessToken)
                completion(.retry)
            case .failure(let error):
                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
                Token.remove(.accessToken)
                Token.remove(.refreshToken)
                completion(.doNotRetryWithError(error))
                exit(0)
            }
        }
    }
}
