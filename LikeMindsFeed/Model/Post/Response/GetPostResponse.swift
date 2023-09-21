//
//  GetPostResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 23/02/23.
//

import Foundation

public struct GetPostResponse: Decodable {
    public let post: Post?
    public let users: [String: User]?
    public let topics: [String: TopicFeedResponse.TopicResponse]?
    public let widgets: [String: Widget]?
}
