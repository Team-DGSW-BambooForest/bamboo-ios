//
//  BaseUseCase.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

protocol BaseUseCase {
    associatedtype T
    func buildUseCaseObservable() -> T
}
