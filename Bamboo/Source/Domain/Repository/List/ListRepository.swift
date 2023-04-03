//
//  ListRepository.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import Foundation
import RxSwift

protocol ListRepository {
    func fetchList(_ request: ListRequest) -> Single<ListData>
}
