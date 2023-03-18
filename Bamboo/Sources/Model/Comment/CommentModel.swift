//
//  CommentModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/26.
//

import Foundation

struct Comment: Codable, Hashable {
    let id: Int
    let profileImage: String
    let writer: String
    let content: String
    let createdAt: String
}

struct Comments: Codable, Hashable {
    let comment: Comment
    let reply: [Comment]
}
