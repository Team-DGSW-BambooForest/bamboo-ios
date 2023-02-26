//
//  Request.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation
import Alamofire

// MARK: - Request and Returns Data
class Requests {
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
    static func post(_ url: String,
                     _ method: HTTPMethod? = nil,
                     params: [String: Any]? = nil) {
        AF.request(url,
                   method: method ?? .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   interceptor: Interceptor()
        )
        .responseData { response in
            switch response.result {
            case .success:
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
