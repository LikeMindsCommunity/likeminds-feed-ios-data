//
//  GetNotificationFeedResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - GetNotificationFeedResponse

public struct GetNotificationFeedResponse: Decodable {
    let activities: [Activity]?
}

// MARK: - Activity
struct Activity: Codable {
    let id: String?
    let action: Int?
    let actionBy: [String]?
    let actionOn: String?
//    let activityEntityData: ActivityEntityData?
    let activityText: String?
//    let activityUserData: []?
    let createdAt: Int?
    let cta, entityID, entityOwnerID: String?
    let entityType: Int?
    let isRead: Bool?
    let updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case action
        case actionBy = "action_by"
        case actionOn = "action_on"
//        case activityEntityData = "activity_entity_data"
        case activityText = "activity_text"
//        case activityUserData = "activity_user_data"
        case createdAt = "created_at"
        case cta
        case entityID = "entity_id"
        case entityOwnerID = "entity_owner_id"
        case entityType = "entity_type"
        case isRead = "is_read"
        case updatedAt = "updated_at"
    }
}
