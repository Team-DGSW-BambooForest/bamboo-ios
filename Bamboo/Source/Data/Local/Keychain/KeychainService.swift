//
//  KeychainService.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import Security
import KeychainAccess

let usernameKey: String = "usernameKey"
let passwordKey: String = "passwordKey"

let keychain = Keychain(service: Bundle.main.bundleIdentifier ?? "")

public class KeychainService {
    class var username: String! {
        get {
            return keychain[usernameKey] ?? ""
        }
        set {
            keychain[usernameKey] = newValue
        }
    }
    class var password: String! {
        get {
            return keychain[passwordKey] ?? ""
        }
        set {
            keychain[passwordKey] = newValue
        }
    }
}
