//
//  GetMemberStateRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetMemberStateRequest: Encodable {
    var uuid: String?
    var communityId: Int? //
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetMemberStateRequest {
        return GetMemberStateRequest()
    }
    
    public func build() -> GetMemberStateRequest {
        return self
    }
    
    public func communityId(_ communityId: Int) -> GetMemberStateRequest {
        self.communityId = communityId
        return self
    }
    
    public func uuid(_ uuid: String) -> GetMemberStateRequest {
        self.uuid = uuid
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case communityId = "community_id"
    }
}
