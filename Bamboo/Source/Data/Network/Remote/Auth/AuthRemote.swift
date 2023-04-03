//
//  AuthRemote.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import RxSwift

class AuthRemote: BaseRemote<DodamAuthAPI> {
    func postSignIn(_ request: SignInRequest) -> Single<DodamResponse<SignInData>> {
        return self.request(.postSignIn(request))
            .map(DodamResponse<SignInData>.self, using: decoder)
    }
}
