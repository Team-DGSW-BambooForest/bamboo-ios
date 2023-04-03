//
//  ListRemote.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

import Foundation
import RxSwift
import RxMoya

class ListRemote: BaseRemote<BambooListAPI>  {
    func getList(_ request: ListRequest) -> Single<ListData> {
        decoder.dateDecodingStrategy = .formatted(Formatter.dateTime)
        return self.request(.fetchList(request)).map(ListData.self, using: decoder)
    }
}
