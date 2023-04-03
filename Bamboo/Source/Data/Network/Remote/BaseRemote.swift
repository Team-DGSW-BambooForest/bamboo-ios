//
//  BaseRemote.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import Moya
import RxSwift
import Alamofire
import Foundation

class BaseRemote<T: TargetType> {
    lazy var request = TokenRefreshRequest(refreshToken: AuthController.getInstance().getRefreshToken())
    #if DEBUG
    lazy var authProvider = MoyaProvider<BambooTokenAPI>(plugins: [NetworkLoggerPlugin()])
    let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    #else
    lazy var authProvider = MoyaProvider<BambooTokenAPI>()
    let provider = MoyaProvider<T>()
    #endif

    let decoder = JSONDecoder()

    func request(_ token: MoyaProvider<T>.Target, callbackQueue: DispatchQueue? = nil) -> Single<Moya.Response> {
        return Observable<Moya.Response>.create { [weak self] subscriber in
            guard let self else { return Disposables.create() }
            self.provider.request(token) { result in
                switch result {
                case let .success(res):
                    subscriber.onNext(res)
                case let .failure(e):
                    subscriber.onError(e)
                }
            }
            return Disposables.create()
        }.asSingle()
    }

    private func tokenRefresh(token: MoyaProvider<T>.Target) -> Single<Moya.Response> {
        return Observable<Moya.Response>.create { [weak self] subscriber in
            guard let self else { return Disposables.create() }
            self.provider.request(token) { result in
                switch result {
                case let .success(res):
                    subscriber.onNext(res)
                case let .failure(e):
                    subscriber.onError(e)
                }
            }
            return Disposables.create()
        }.asSingle()
            .map(DodamResponse<String>.self, using: decoder)
            .flatMap { [weak self] response -> Single<Moya.Response> in
                guard let self = self else { return .error(BambooError.error(message: "네트워크 오류가 발생했습니다.", type: .selfIsNil, errorBody: ["where": "BaseRemote:31"])) }
                AuthController.getInstance().tokenRefresh(token: response.data)
                return self.provider.rx.request(token)
            }.catch { error in
                if let error = error as? BambooError,
                   case let .error(_, _, body) = error,
                   let status = body["status"] as? Int,
                   status == 410 {
                    return .error(BambooError.error(message: "세션이 만료되었습니다."))
                }
                return .error(error)
            }
    }
}


