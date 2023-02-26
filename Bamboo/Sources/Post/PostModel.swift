//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI

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
    func sendComment(_ id: String) {
        if !self.commentInput.isEmpty {
            Requests.post("\(commentAPI)/create",
                          params: ["postId": id, "parentCommnetId": 0, "content": commentInput])
            commentInput = String()
        }
    }
}
