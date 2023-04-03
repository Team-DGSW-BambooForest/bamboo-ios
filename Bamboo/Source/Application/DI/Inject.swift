//
//  Inject.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Swinject

@propertyWrapper
final class Inject<T> {

    let wrappedValue: T
    init() {
        wrappedValue = DependencyProvider.shared.container.resolve(T.self)!
    }
}
