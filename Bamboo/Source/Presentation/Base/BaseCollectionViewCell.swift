//
//  BaseCollectionViewCell.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

import UIKit
import RxSwift

class BaseCollectionViewCell<T>: UICollectionViewCell{
    let bound = UIScreen.main.bounds
    lazy var disposeBag: DisposeBag = .init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureCell()
        //if traitCollection.userInterfaceStyle == .dark { darkConfigure() }
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayoutSubviews()
    }
    func addView(){}
    func setLayout(){}
    func setLayoutSubviews(){}
    func configureCell(){}
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }
    //func darkConfigure(){}
    func bind(_ model: T){}
}
