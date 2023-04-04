//
//  ListCell.swift
//  Bamboo
//
//  Created by Mercen on 2023/04/04.
//

import UIKit
import Then
import ReactorKit
import RxSwift

final class ListCell: BaseCollectionViewCell<ListReactor> {
    // MARK: - Properties
    private let rootContainer = UIView().then {
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    private let cardView = UIView().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .tertiarySystemBackground
    }
    private let moveToInfoButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 5
    }
    private let stateImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart.circle")
        $0.contentMode = .scaleToFill
        $0.tintColor = .label
    }
    private let commentLabel = UILabel().then {
        $0.text = "저런.. 이걸 거절당하네 ㅋㅋㅋ"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private var postItem: PostItem!
    private var delegate: ListCellDelegate!

    // MARK: - UI
    override func addView() {
        contentView.addSubViews(rootContainer)
    }
    override func setLayoutSubviews() {
        super.setLayoutSubviews()
    }
    override func setLayout() {
    }

    private func layout() {
    }
    // MARK: - Reactor
    func bindView(reactor: ListReactor) {
//        moveToInfoButton.rx.tap
//            .map { _ in .moveToInfoButtonDidTap }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
    }

}

extension ListCell {
    func initData(postItem: PostItem){
        self.postItem = postItem
    }
}

protocol ListCellDelegate {
    func onClickCell(postItem: PostItem)
}
