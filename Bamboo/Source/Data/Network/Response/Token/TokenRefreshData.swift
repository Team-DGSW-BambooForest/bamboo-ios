//
//  TokenRefreshData.swift
//  Bamboo
//
//  Created by Mercen on 2023/03/27.
//

class TokenRefreshData: Codable {
    var name: String!
    var profileImage: String?
    var location: String!

    private enum CodingKeys: String, CodingKey {
        case name
        case profileImage
        case location
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profileImage = try container.decodeIfPresent(String.self, forKey: .profileImage) ?? ""
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
    }
}
