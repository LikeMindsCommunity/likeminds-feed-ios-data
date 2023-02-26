//
//  User.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public struct User: Codable {
    public let id: String
    public let imageUrl, name, organisationName, userUniqueId: String?
    public let isGuest: Bool
    public let isDeleted: Bool?
    public let isOwner: Bool?
    public let customTitle: String?
    public let state, updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageUrl = "image_url"
        case organisationName = "organisation_name"
        case userUniqueId = "user_unique_id"
        case isGuest = "is_guest"
        case isDeleted = "is_deleted"
        case isOwner = "is_owner"
        case customTitle = "custom_title"
        case state
        case updatedAt = "updated_at"
    }
}
