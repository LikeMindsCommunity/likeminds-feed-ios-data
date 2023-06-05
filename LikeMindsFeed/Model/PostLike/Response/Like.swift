//
//  Like.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - Like
public struct Like: Codable {
    public let id: String
    public let createdAt, updatedAt: Int?
    public let userId: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}
