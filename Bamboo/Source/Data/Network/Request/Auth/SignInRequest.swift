//
//  SignInRequest.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

class SignInRequest: Encodable {
    var id: String = ""
    var pw: String = ""
    let clientId: String = Constants.DAUTH_KEY
    let redirectUrl: String = Constants.DAUTH_REDIRECT_URI
    let state: String = "null"

    convenience init(id: String, pw: String) {
        self.init()
        self.id = id
        self.pw = pw
    }
}
