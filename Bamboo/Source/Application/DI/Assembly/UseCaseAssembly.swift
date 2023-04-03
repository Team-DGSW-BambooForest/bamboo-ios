//
//  UseCaseAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - List
        container.register(FetchListUseCase.self) { r in
            FetchListUseCase(listRepository: r.resolve(ListRepository.self)!)
        }.inObjectScope(.container)
    }
}

