//
//  DodamResponse.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

class DodamResponse<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
