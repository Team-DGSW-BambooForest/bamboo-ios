//
//  AppFlow.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import RxFlow
import RxRelay
import RxSwift
import UIKit

struct AppStepper: Stepper {
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    func readyToEmitSteps() {
        Observable.just(BambooStep.listIsRequired)
            .bind(to: steps)
            .disposed(by: disposeBag)
    }
}

final class AppFlow: Flow {
    
    // MARK: - Properties
    var root: Presentable {
        return self.rootWindow
    }
    
    private let rootWindow: UIWindow
    
    // MARK: - Init
    
    init(
        with window: UIWindow
    ) {
        self.rootWindow = window
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? BambooStep else { return .none }
        switch step {
        case .listIsRequired:
            return navigateToList()
        default:
            return .none
        }
    }
}
// MARK: - Method
private extension AppFlow {
    private func navigateToList() -> FlowContributors {
        @Inject var listFlow: ListFlow
        
        Flows.use(
            listFlow,
            when: .created
        ) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: listFlow, withNextStepper: listFlow.stepper))
    }
}
