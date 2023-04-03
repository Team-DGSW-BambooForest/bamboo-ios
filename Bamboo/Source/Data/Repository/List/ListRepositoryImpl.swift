//
//  ListRepositoryImpl.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import Foundation
import RxSwift

class ListRepositoryImpl: ListRepository {
    private let listDataSource: ListDataSource
    
    init(listDataSource: ListDataSource){
        self.listDataSource = listDataSource
    }

    func fetchList(_ request: ListRequest) -> Single<ListData> {
        return listDataSource.fetchList(request)
    }
}
