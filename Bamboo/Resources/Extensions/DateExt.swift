//
//  DateExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/21.
//

import Foundation

extension Date {
    var toRelativeDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
