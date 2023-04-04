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
    private let topContainer = UIView()
    private let refreshControl = UIRefreshControl()
    
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
    
    private let profileButton = UIButton(type: .system)
    
    private let profileImage = UIImageView().then {
        $0.image = BambooAsset.anon
        $0.contentMode = .scaleToFill
        $0.frame.size.width = 34
        $0.frame.size.height = 34
        $0.layer.cornerRadius = CGRectGetWidth($0.frame) / 2
        $0.layer.masksToBounds = true
    }
    
    private let dropdownImage = UIImageView().then {
        $0.image = BambooAsset.dropdown
        $0.contentMode = .scaleToFill
        $0.frame.size.width = 12
        $0.frame.size.height = 12
    }
    
    private let listView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reusableID)
        $0.backgroundColor = BambooAsset.background
        $0.isScrollEnabled = true
        $0.alwaysBounceVertical = true
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
    override func configureVC() {
        listView.refreshControl = refreshControl
    }
    
    override func addView() {
        view.addSubViews(topContainer,
                         logoImage,
                         searchButton,
                         writeButton,
                         listView)
    }

    override func setLayoutSubViews() {
        topContainer.addSubViews(logoImage, searchButton, writeButton)
    }

    override func setLayout() {
        logoImage.snp.makeConstraints { make in
            make.leading.equalTo(topContainer)
            make.width.equalTo(78)
            make.height.equalTo(29)
            make.centerY.equalTo(topContainer.snp.centerY)
        }
        writeButton.snp.makeConstraints { make in
            make.trailing.equalTo(topContainer)
            make.centerY.equalTo(topContainer.snp.centerY)
        }
        searchButton.snp.makeConstraints { make in
            make.trailing.equalTo(writeButton.snp.leading).offset(-20)
            make.centerY.equalTo(topContainer.snp.centerY)
        }
        topContainer.snp.makeConstraints { make in
            make.leading.equalTo(14)
            make.trailing.equalTo(-14)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        listView.snp.makeConstraints { make in
            make.top.equalTo(topContainer.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    // MARK: - Reactor
    override func bindView(reactor: ListReactor) {
        searchButton.rx.tap
            .map { _ in Reactor.Action.searchButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        writeButton.rx.tap
            .map { _ in Reactor.Action.writeButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        profileButton.rx.tap
            .map { _ in Reactor.Action.profileButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
