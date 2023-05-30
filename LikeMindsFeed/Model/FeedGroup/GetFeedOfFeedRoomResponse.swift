//
//  GetFeedGroupResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - DataClass
public struct GetFeedOfFeedRoomResponse: Decodable {
    public let posts: [Post]?
    public let users: [LikedUser]
}
