//
//  GetFeedGroupRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

public struct GetFeedOfFeedRoomRequest: Encodable {
    let feedroomId: String
    
    public init(feedroomId: String) {
        self.feedroomId = feedroomId
    }
    
    enum CodingKeys: String, CodingKey {
        case feedroomId = "feedroom_id"
    }
}
