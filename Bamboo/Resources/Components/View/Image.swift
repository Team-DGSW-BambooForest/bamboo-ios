//
//  Image.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI
import Kingfisher

// MARK: - 이미지 프로세서
struct BambooImage: View {

    let url: String

    init(_ url: String) {
        self.url = url
    }
    
    var body: some View {
        
        // MARK: - 이미지
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
