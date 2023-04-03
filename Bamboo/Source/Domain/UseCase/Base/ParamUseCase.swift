//
//  ParamUseCase.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

protocol ParamUseCase {
    associatedtype T
    associatedtype P
    func buildUseCaseObservable(_ param: P) -> T
}
