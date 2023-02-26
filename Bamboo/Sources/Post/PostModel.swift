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
    @Published var commentInput = String()
    func loadData(_ id: String) {
        Requests.get("\(postAPI)/\(id)",
                     Post.self) { data in
            self.post = data
        }
        Requests.get("\(commentAPI)/\(id)",
                     [Comment].self) { datas in
            datas.forEach { comment in
                Requests.get("\(commentAPI)/nested/\(comment.commentId)",
                             [Comment].self) { nested in
                    self.comments.append(FullComment(comment: comment, nested: nested))
                }
            }
            print(self.comments)
        }
    }
    func sendComment() {
        Requests.post("\(commentAPI)/create",
                      .post, params: [:])
    }
}
