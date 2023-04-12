//
//  GetFeedResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public struct GetFeedResponse: Decodable {
    public let posts: [Post]?
    public let users: [String: User]?
}
