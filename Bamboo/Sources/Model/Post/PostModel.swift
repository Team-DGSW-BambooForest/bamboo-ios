//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import Foundation

struct Post: Codable, Hashable {
    let postId: Int
    let author: String
    let profileImage: String
    let content: String
    let createdAt: Date
}
