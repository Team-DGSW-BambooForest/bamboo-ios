//
//  CommentModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/26.
//

import Foundation

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
