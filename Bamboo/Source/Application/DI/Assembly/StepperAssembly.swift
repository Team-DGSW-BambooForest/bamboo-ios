//
//  StepperAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Swinject
import RxFlow

class StepperAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListStepper.self) { _ in
            ListStepper()
        }
    }
}
