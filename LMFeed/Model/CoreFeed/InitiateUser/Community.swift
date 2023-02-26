//
//  Community.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - IntialCommunity
public struct Community: Decodable {
    public  var id: Int?
    public  var name, purpose: String?
    public  var imageURL: String?
    public var createdBy: String?
    public var promotersCount, MembersCount, MemberState: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, purpose
        case imageURL = "image_url"
        case createdBy = "created_by"
        case promotersCount = "promoters_count"
        case MembersCount = "members_count"
        case MemberState = "member_state"
    }
}
