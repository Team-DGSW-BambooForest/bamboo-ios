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

// MARK: - List Model
class ListModel: ObservableObject {
    
    @Published var list = [Post]()
    @Published var page = 0
    @Published var pageEnded = false
    
    // MARK: - Data Loader
    func loadData() {
        if !pageEnded {
            request("\(postAPI)/list", .get,
                    params: ["page": page], List.self)
            { data in
                
                // MARK: - Checking Page Finished
                if data.list.isEmpty {
                    self.pageEnded = true
                }
                
                // MARK: - Adding Data to List
                else {
                    withAnimation(.default) {
                        self.list += data.list
                    }
                }
            }
        }
    }
    
    // MARK: - Data Refresher
    func refreshData() {
        self.page = 0
        self.pageEnded = false
        self.loadData()
    }
}
