//
//  PostModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/22.
//

import SwiftUI

class PostModel: ObservableObject {
    @Published var list = [Post]()
    func loadData() {
        request("\(postAPI)/list", .get, List.self) { data in
            self.list = data.list
        }
    }
}
