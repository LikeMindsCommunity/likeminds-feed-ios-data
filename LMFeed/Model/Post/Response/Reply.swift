//
//  Reply.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - Reply
public struct Reply: Codable {
    
    public let userId, text: String?
    public let level, likesCount, repliesCount: Int?
    public let menuItems: [MenuItem]?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case text, level
        case likesCount = "likes_count"
        case repliesCount = "replies_count"
        case menuItems = "menu_items"
    }
}
