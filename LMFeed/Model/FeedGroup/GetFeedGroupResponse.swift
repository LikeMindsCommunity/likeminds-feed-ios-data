//
//  GetFeedGroupResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - DataClass
struct GetFeedGroupResponse: Decodable {
    let posts: [Post]?
    let users: [LikedUser]
}
