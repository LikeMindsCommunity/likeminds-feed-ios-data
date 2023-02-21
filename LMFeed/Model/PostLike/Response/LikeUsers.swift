//
//  LikeUsers.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let name: String
    let imageURL: String
    let userUniqueID: String
    let isGuest: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case userUniqueID = "user_unique_id"
        case isGuest = "is_guest"
    }
}
