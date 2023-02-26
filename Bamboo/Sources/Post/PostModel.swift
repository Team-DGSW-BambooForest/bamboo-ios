//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI

struct HashTag: Codable, Hashable {
    let tagId: Int
    let hashTag: String
}

struct Post: Codable, Hashable {
    let postId: Int
    let author: String
    let profileImage: String
    let content: String
    let createdAt: Date
    let hashTags: [HashTag]
}

// MARK: - 포스트 모델
class PostModel: ObservableObject {
    
    @Published var post: Post?
    @Published var comments = [FullComment]()
    @Published var commentInput = String()
    
    // MARK: - 글 로드
    func loadData(_ id: String) {
        Requests.get("\(postAPI)/\(id)",
                     Post.self) { data in
            self.post = data
        }
        
        // MARK: - 댓글 로드
        Requests.get("\(commentAPI)/\(id)",
                     [Comment].self) { datas in
            datas.forEach { comment in
                
                // MARK: - 대댓글 로드
                Requests.get("\(commentAPI)/nested/\(comment.commentId)",
                             [Comment].self) { nested in
                    self.comments.append(FullComment(comment: comment, nested: nested))
                }
            }
            print(self.comments)
        }
    }
    
    // MARK: - 댓글 등록
    func sendComment(_ id: String) {
        if !self.commentInput.isEmpty {
            Requests.post("\(commentAPI)/create",
                          params: ["postId": id, "parentCommentId": 0, "content": commentInput])
            commentInput = String()
        }
    }
}
