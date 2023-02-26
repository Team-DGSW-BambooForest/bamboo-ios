//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI

struct Comment: Codable, Hashable {
    let commentId: Int
    let profileImage: String
    let writer: String
    let content: String
    let diffTime: String
}

struct FullComment: Codable, Hashable {
    let comment: Comment
    let nested: [Comment]
}

class PostModel: ObservableObject {
    @Published var post: Post?
    @Published var comments = [FullComment]()
    func loadData(_ id: String) {
        request("\(postAPI)/\(id)", .get, Post.self) { data in
            self.post = data
        }
        request("\(commentAPI)/\(id)", .get, [Comment].self) { datas in
            datas.forEach { comment in
                request("\(commentAPI)/nested/\(comment.commentId)", .get, [Comment].self) { nested in
                    self.comments.append(FullComment(comment: comment, nested: nested))
                }
            }
            print(self.comments)
        }
    }
}
