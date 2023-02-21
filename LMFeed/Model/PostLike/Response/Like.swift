//
//  Like.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - Like
struct Like: Codable {
    let id: String
    let createdAt, updatedAt: Int
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case user
    }
}
