//
//  ListModel.swift
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

struct List: Codable {
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
