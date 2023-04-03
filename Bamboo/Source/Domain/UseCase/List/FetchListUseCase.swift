//
//  FetchListUseCase.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

import Foundation
import RxSwift

class FetchListUseCase: ParamUseCase {
    private let listRepository: ListRepository

    public init(listRepository: ListRepository) {
        self.listRepository = listRepository
    }

    public func buildUseCaseObservable(_ param: Param) -> Single<ListData> {
        return listRepository.fetchList(param.listRequest)
    }

    public final class Param {
        let listRequest: ListRequest

        public init(listRequest: ListRequest) {
            self.listRequest = listRequest
        }
    }
}
