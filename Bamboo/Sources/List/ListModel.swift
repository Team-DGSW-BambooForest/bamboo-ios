//
//  ListModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI
import Alamofire

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

struct List: Codable, Hashable {
    let list: [Post]
}

class ListModel: ObservableObject {
    @Published var list = [Post]()
    func loadData() {
        request("\(postAPI)/list", .get, List.self) { data in
            self.list = data.list
        }
    }
}
