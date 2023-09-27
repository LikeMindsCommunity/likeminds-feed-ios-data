//
//  Post.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - Post
public struct Post: Decodable {
    public let id: String
    public let attachments: [Attachment]?
    public let commentsCount, communityID, createdAt: Int?
    public let isPinned, isSaved, isEdited, isDeleted: Bool?
    public let isLiked: Bool?
    public let likesCount: Int?
    public let menuItems: [MenuItem]?
    public let text: String?
    public let heading: String?
    public let updatedAt: Int?
    public let userId, uuid, deletedByUUID, deleteReason: String?
    public let replies: [Comment]?
    public let tempId: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case attachments
        case commentsCount = "comments_count"
        case communityID = "community_id"
        case createdAt = "created_at"
        case isPinned = "is_pinned"
        case isSaved = "is_saved"
        case isLiked = "is_liked"
        case isEdited = "is_edited"
        case likesCount = "likes_count"
        case menuItems = "menu_items"
        case text, heading
        case updatedAt = "updated_at"
        case userId = "user_id"
        case deletedByUUID = "deleted_by_uuid"
        case isDeleted = "is_deleted"
        case deleteReason = "delete_reason"
        case replies
        case uuid
        case tempId = "temp_id"
    }
}
