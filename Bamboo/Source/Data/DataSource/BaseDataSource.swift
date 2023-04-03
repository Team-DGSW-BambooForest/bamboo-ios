//
//  BaseDataSource.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Moya

class BaseDataSource<RM, CH> {
    let remote: RM
    let cache: CH

    init(remote: RM, cache: CH) {
        self.remote = remote
        self.cache = cache
    }
}
