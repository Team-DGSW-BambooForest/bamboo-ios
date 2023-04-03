//
//  ListDataSource.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Moya
import RxSwift

class ListDataSource: BaseDataSource<ListRemote, Any?> {
    func fetchList(_ request: ListRequest) -> Single<ListData> {
        return remote.getList(request)
    }
}
