//
//  ViewExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

import UIKit

extension UIView {
    func addSubViews(_ subView: UIView...) {
        subView.forEach(addSubview(_:))
    }
}
