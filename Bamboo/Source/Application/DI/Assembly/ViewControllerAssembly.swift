//
//  ViewControllerAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListVC.self) { r in
            ListVC(reactor: r.resolve(ListReactor.self))
        }
    }
}
