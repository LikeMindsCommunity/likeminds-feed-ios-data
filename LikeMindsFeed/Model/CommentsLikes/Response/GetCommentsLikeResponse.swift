//
//  GetCommentsLikeResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - GetCommentsLikeResponse
public struct GetCommentsLikeResponse: Codable {
    public let likes: [Like]
    public let totalLikes: Int
    public let users: [String: User]?
    
    enum CodingKeys: String, CodingKey {
        case likes
        case totalLikes = "total_count"
        case users
    }
}
