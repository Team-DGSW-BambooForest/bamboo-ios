//
//  Request.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation
import Alamofire

// MARK: - 요청과 응답 처리
class Requests {
    
    // MARK: - Get 요청
    static func get<T: Decodable>(_ url: String,
                           params: [String: Any]? = nil,
                           _ model: T.Type,
                           completion: @escaping (T) -> Void) {
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   interceptor: Interceptor()
        )
        .validate()
        .responseData { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    print(String(decoding: response.data!, as: UTF8.self))
                    // let decodedData = try! decoder.decode(T.self, from: data)
                    if let decodedData = try? decoder.decode(T.self, from: data) {
                        DispatchQueue.main.async {
                            completion(decodedData)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Post 요청
    static func post(_ url: String,
                     _ method: HTTPMethod? = nil,
                     params: [String: Any]? = nil) {
        AF.request(url,
                   method: method ?? .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   interceptor: Interceptor()
        )
        .validate()
        .responseData { response in
            switch response.result {
            case .success:
                print(String(decoding: response.data!, as: UTF8.self))
            case .failure(let error):
                print("에?러: \(String(describing: error.errorDescription))")
            }
        }
    }
}
