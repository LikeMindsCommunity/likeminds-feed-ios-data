//
//  Comment.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - Comment
public struct Comment: Codable {
    public let id, postId, userId: String
    public let commentsCount, createdAt, level, likesCount: Int?
    public let menuItems: [MenuItem]?
    public let replies: [Comment]?
    public let text: String?
    public let updatedAt: Int?
    public let users: [User]?
    public let isLiked: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case postId = "post_id"
        case userId = "user_id"
        case commentsCount = "comments_count"
        case createdAt = "created_at"
        case level
        case likesCount = "likes_count"
        case menuItems = "menu_items"
        case replies, text
        case updatedAt = "updated_at"
        case users
        case isLiked = "is_liked"
    }
}
