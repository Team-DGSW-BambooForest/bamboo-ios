//
//  ReusableExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/04/04.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reusableID: String { get }
}
public extension ReuseIdentifiable {
    static var reusableID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}
