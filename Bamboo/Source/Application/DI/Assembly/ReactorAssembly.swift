//
//  ReactorAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import Swinject

class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListReactor.self) { r in
            ListReactor(r.resolve(ListRequest.self)!, useCase: r.resolve(FetchListUseCase.self)!)
        }
    }
}
