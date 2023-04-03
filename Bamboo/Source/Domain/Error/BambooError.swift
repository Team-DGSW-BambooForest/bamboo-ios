//
//  BambooError.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

enum BambooError: Error {
    case error(message: String, type: ErrorType = .basic, errorBody: [String: Any] = Dictionary())
}

enum ErrorType: String {
    case basic = "BASIC"
    case selfIsNil = "SELF_IS_NIL"
    case unhandled = "UNHANDLED"
}
