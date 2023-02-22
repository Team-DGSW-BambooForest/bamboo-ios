//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI

class PostModel: ObservableObject {
    @Published var post: Post?
    func loadData(_ id: String) {
        request("\(postAPI)/\(id)", .get, Post.self) { data in
            self.post = data
        }
    }
}
