//
//  Comment.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - Comment
public struct Comment: Codable {
    public let id, userId, uuid: String?
    public let postId: String?
    public let commentsCount, createdAt, level, likesCount: Int?
    public let isEdited, isLiked: Bool?
    public let menuItems: [MenuItem]?
    public let replies: [Comment]?
    public let text: String?
    public let updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case postId = "post_id"
        case userId = "user_id"
        case isEdited = "is_edited"
        case isLiked = "is_liked"
        case commentsCount = "comments_count"
        case createdAt = "created_at"
        case level
        case likesCount = "likes_count"
        case menuItems = "menu_items"
        case replies, text, uuid
        case updatedAt = "updated_at"
    }
}
