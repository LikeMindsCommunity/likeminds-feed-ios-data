//
//  MemberStateResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - MemberStateResponse
public struct GetMemberStateResponse: Codable {
    public let createdAt: Int
    public let editRequired: Bool
    public let member: User?
    public let memberRights: [MemberRight]
    public let state, toolState: Int?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case editRequired = "edit_required"
        case member
        case memberRights = "member_rights"
        case state
        case toolState = "tool_state"
    }
}
