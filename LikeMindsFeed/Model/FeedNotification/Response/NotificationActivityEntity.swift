//
//  NotificationActivityEntity.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

// MARK: - ActivityEntityData
public struct ActivityEntityData: Codable {
    public let id: String?
    public let attachments: [Attachment]?
    public let commentsCount, communityID, createdAt: Int?
    public let heading: String?
    public let isEdited, isLiked, isPinned, isSaved: Bool?
    public let likesCount: Int?
    public let menuItems: [MenuItem]?
    public let text: String?
    public let updatedAt: Int?
    public let userID, uuid, deleteReason, deletedBy: String?
    public let isDeleted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case attachments
        case commentsCount = "comments_count"
        case communityID = "community_id"
        case createdAt = "created_at"
        case heading
        case isEdited = "is_edited"
        case isLiked = "is_liked"
        case isPinned = "is_pinned"
        case isSaved = "is_saved"
        case likesCount = "likes_count"
        case menuItems = "menu_items"
        case text
        case updatedAt = "updated_at"
        case userID = "user_id"
        case uuid
        case deleteReason = "delete_reason"
        case deletedBy = "deleted_by"
        case isDeleted = "is_deleted"
    }
}
