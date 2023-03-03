//
//  GetFeedGroupResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - DataClass
public struct GetFeedGroupResponse: Decodable {
    public let posts: [Post]?
    public let users: [LikedUser]
}
