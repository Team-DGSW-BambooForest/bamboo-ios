//
//  ListReactor.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class ListReactor: Reactor, Stepper {
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    private let listRequest: ListRequest
    private let fetchListUseCase: FetchListUseCase
    var initialState: State = State()

    // MARK: - Reactor
    enum Action {
        case refresh
        case searchButtonDidTap
        case writeButtonDidTap
        case profileButtonDidTap
    }
    enum Mutation {}
    struct State {}
    
    init(
        _ listRequest: ListRequest,
        useCase fetchListUseCase: FetchListUseCase
    ) {
        self.listRequest = listRequest
        self.fetchListUseCase = fetchListUseCase
    }
}

// MARK: - Mutate
extension ListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            return .empty()
        case .searchButtonDidTap:
            return .empty()
        case .writeButtonDidTap:
            return .empty()
        case .profileButtonDidTap:
            return .empty()
        }
    }
}
