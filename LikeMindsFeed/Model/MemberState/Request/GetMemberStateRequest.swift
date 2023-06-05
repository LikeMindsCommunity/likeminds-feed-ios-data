//
//  GetMemberStateRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetMemberStateRequest: Encodable {
    var memberId: String
    var communityId: Int //
    
    public init(memberId: String, communityId: Int) {
        self.memberId = memberId
        self.communityId = communityId
    }
    
    enum CodingKeys: String, CodingKey {
        case memberId = "member_id"
        case communityId = "community_id"
    }
}
