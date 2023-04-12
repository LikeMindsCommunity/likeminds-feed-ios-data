//
//  GetPostLikeResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - GetPostLikeResponse
public struct GetPostLikeResponse: Codable {
    public let likes: [Like]?
    public let totalCount: Int?
    public let users: [String: User]
    
    enum CodingKeys: String, CodingKey {
        case likes, users
        case totalCount = "total_count"
    }
}
