//
//  PostItem.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/25.
//

import Foundation

class PostItem: Codable {
    let postId: Int!
    let author: String!
    let profileImage: String!
    let content: String!
    let createdAt: Date!

    private enum CodingKeys: String, CodingKey {
        case postId
        case author
        case profileImage
        case content
        case createdAt
    }
    
    required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        
        postId = try container.decodeIfPresent(Int.self, forKey: .postId)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        profileImage = try container.decodeIfPresent(String.self, forKey: .profileImage)
        content = try container.decodeIfPresent(String.self, forKey: .content)
        createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
    }
}
