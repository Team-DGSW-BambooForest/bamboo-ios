//
//  Request.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation
import Alamofire

// MARK: - Request and Returns Data
func request<T: Decodable>(_ url: String,
                           _ method: HTTPMethod,
                           params: [String: Any]? = nil,
                           _ model: T.Type,
                           completion: @escaping (T) -> Void) {
    AF.request(url,
               method: method,
               parameters: nil,
               encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
               interceptor: Interceptor()
    )
    .responseData { response in
        if let data = response.data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedData = try? decoder.decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            }
        }
    }
}
