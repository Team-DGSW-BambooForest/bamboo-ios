//
//  FlowAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Swinject

class FlowAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - List
        container.register(ListFlow.self) { _ in
            ListFlow()
        }
    }
}

