//
//  ListFlow.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import RxFlow
import RxRelay
import UIKit

struct ListStepper: Stepper {
    let steps: PublishRelay<Step> = .init()

    var initialStep: Step {
        return BambooStep.listIsRequired
    }
}

final class ListFlow: Flow {
    // MARK: - Properties

    var root: Presentable {
        return self.rootVC
    }
    @Inject private var vc: ListVC
    @Inject var stepper: ListStepper
    private let rootVC = UINavigationController()

    // MARK: - Init
    deinit {
        print("❎ \(type(of: self)): \(#function)")
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
private extension ListFlow {
    private func navigateToList() -> FlowContributors {
        @Inject var reactor: ListReactor
        let vc = ListVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}

