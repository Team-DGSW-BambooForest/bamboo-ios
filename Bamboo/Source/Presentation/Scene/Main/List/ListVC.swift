//
//  ListVC.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import UIKit
import RxCocoa
import SnapKit
import Then

final class ListVC: BaseVC<ListReactor> {
    // MARK: - Assets
    enum Metric {
    }
    
    enum Image {
    }

    // MARK: - Properties
    private let rootContainer = UIView()
    private let topContainer = UIView()
    
    private let logoImage = UIImageView().then {
        $0.image = BambooAsset.logo!
    }
    
    private let searchButton = UIButton(type: .system).then {
        let image = BambooAsset.search
        $0.setImage(image, for: .normal)
        $0.imageView!.contentMode = .scaleAspectFit
        $0.frame.size.width = 24
        $0.frame.size.height = 24
        $0.tintColor = .label
    }
    
    private let writeButton = UIButton(type: .system).then {
        let image = BambooAsset.add
        $0.setImage(image, for: .normal)
        $0.imageView!.contentMode = .scaleAspectFit
        $0.frame.size.width = 24
        $0.frame.size.height = 24
        $0.tintColor = .label
    }
    
    private let topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.spacing = 15
        $0.frame.size.height = 52
    }
    

    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - UI
    override func addView() {
        view.addSubViews(topContainer,
                         rootContainer,
                         logoImage,
                         searchButton,
                         writeButton,
                         topStackView)
    }

    override func setLayoutSubViews() {
        topStackView.addArrangedSubview(logoImage)
        topStackView.addArrangedSubview(searchButton)
        topStackView.addArrangedSubview(writeButton)
    }

    override func setLayout() {
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(78)
            make.height.equalTo(29)
        }
        topStackView.snp.makeConstraints { make in
            make.leading.equalTo(14)
            make.trailing.equalTo(-14)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
    }

    override func configureVC() {
        
    }

    // MARK: - Reactor
    override func bindView(reactor: ListReactor) {
//        signUpButton.rx.tap
//            .map { _ in Reactor.Action.signUpButtonDidTap }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
    }
}
