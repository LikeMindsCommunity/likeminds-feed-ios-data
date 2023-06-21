//
//  NotificationActivity.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

// MARK: - Activity
public struct Activity: Codable {
    public let id: String?
    public let action: Int?
    public let actionBy: [String]?
    public let actionOn: String?
    public let activityEntityData: ActivityEntityData?
    public let activityText: String?
    public let createdAt: Int?
    public let cta, entityID, entityOwnerID: String?
    public let entityType: Int?
    public let isRead: Bool?
    public let updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case action
        case actionBy = "action_by"
        case actionOn = "action_on"
        case activityEntityData = "activity_entity_data"
        case activityText = "activity_text"
        case createdAt = "created_at"
        case cta
        case entityID = "entity_id"
        case entityOwnerID = "entity_owner_id"
        case entityType = "entity_type"
        case isRead = "is_read"
        case updatedAt = "updated_at"
    }
}
