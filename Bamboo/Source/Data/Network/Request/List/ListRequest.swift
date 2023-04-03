//
//  ListRequest.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

class ListRequest: Codable {
    let page: Int
    
    init(page: Int){
        self.page = page
    }
}
