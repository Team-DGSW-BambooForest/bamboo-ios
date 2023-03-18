//
//  PostState.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/19.
//

import Combine

// MARK: - 포스트 모델
class PostModel: ObservableObject {
    
    @Published var post: Post?
    @Published var comments = [Comments]()
    @Published var commentInput = String()
    
    // MARK: - 글 로드
    func loadData(_ id: String) {
        Requests.get("\(postAPI)/\(id)",
                     Post.self) { data in
            self.post = data
        }
        
        // MARK: - 댓글 로드
        Requests.get("\(commentAPI)/comments/\(id)",
                     [Comments].self) { data in
            self.comments = data
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
