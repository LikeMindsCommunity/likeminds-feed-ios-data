//
//  LikeUsers.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - User
public struct LikedUser: Codable {
    public let userId: Int
    public let user: User?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case user
    }
}
