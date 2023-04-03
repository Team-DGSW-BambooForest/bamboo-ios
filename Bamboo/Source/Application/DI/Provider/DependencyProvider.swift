//
//  DependencyProvider.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Swinject

class DependencyProvider {

    static let shared = DependencyProvider()

    let container = Container()
    let assembler: Assembler

    init() {
        Container.loggingFunction = nil
        assembler = Assembler(
            [
                RepositoryAssembly(),
                ReactorAssembly(),
                DataSourceAssembly(),
                UseCaseAssembly(),
                ViewControllerAssembly(),
                FlowAssembly(),
                StepperAssembly()
            ],
            container: container
        )
    }
}
