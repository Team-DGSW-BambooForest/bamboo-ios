//
//  RepositoryAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListRepository.self) { r in
            return ListRepositoryImpl(listDataSource: r.resolve(ListDataSource.self)!)
        }.inObjectScope(.container)
    }
}
