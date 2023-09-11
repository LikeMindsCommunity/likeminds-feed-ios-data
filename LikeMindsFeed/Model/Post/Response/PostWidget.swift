//
//  PostWidget.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 07/09/23.
//

import Foundation

// MARK: - The64F8Daeebc8A8F166658F42E
public struct Widget: Decodable {
    public let metadata: WidgetMetadata?
    public let parentEntityID, id, parentEntityType: String?
    public let updatedAt, createdAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case metadata
        case parentEntityID = "parent_entity_id"
        case id = "_id"
        case parentEntityType = "parent_entity_type"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
}

// MARK: - Metadata
public struct WidgetMetadata: Decodable {
    public let body: String?
    public let ogTags: Topic?
    public let size: Int?
    public let title, name: String?
    public let coverImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case body
        case ogTags = "og_tags"
        case size, title, name
        case coverImageURL = "cover_image_url"
    }
}

// MARK: - Topic
public struct Topic: Decodable {
    
}
