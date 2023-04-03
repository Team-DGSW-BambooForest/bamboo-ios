//
//  ListData.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/26.
//

class ListData: Codable {
    var hasMorePage: Bool!
    var currentPage: Int!
    var list: [PostItem]!

    private enum CodingKeys: String, CodingKey {
        case hasMorePage
        case currentPage
        case list
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hasMorePage = try container.decodeIfPresent(Bool.self, forKey: .hasMorePage)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.list = try container.decodeIfPresent([PostItem].self, forKey: .list)
    }
}

