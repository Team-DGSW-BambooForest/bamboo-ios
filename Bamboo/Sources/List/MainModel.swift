//
//  MainModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI
import Alamofire

struct HashTag: Codable {
    let tagId: Int
    let hashTag: String
}

struct Post: Codable {
    let postId: Int
    let author: String
    let profileImage: String
    let content: String
    let createAt: Date
    let hashTags: [HashTag]
}

struct Posts: Codable {
    let list: [Post]
}

class MainModel: ObservableObject {
    @Published var posts = [Post]()
    func loadData() {
        request("\(postAPI)/list", .get, Posts.self) { data in
            self.posts = data.list
        }
    }
}
