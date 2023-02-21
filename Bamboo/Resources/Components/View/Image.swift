//
//  Image.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI
import Kingfisher

// MARK: - Image Processor of Bamboo
struct BambooImage: View {
    
    /// Variables
    let url: String
    
    /// Initializer
    init(_ url: String) {
        self.url = url
    }
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Bamboo.lightGray
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .cancelOnDisappear(true)
            .cacheMemoryOnly()
            .resizable()
    }
}
