//
//  FontExt.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/18.
//

import SwiftUI

extension Text {
    func setFont(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Text {
        self
            .font(.system(size: size, weight: weight))
    }
}
