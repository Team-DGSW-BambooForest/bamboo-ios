//
//  DataSourceAssembly.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import Swinject

class DataSourceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SignInRequest.self) { _ in
            SignInRequest()
        }.inObjectScope(.container)
        
        // MARK: - List
        container.register(ListRequest.self) { _ in
            ListRequest(page: 0)
        }.inObjectScope(.container)
        
        container.register(ListDataSource.self) { _ in
            ListDataSource(remote: ListRemote(), cache: nil)
        }.inObjectScope(.container)
    }
}

