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
    public let topics: [String: TopicFeedResponse.TopicResponse]?
    public let widgets: [String: Widget]?
    public let filteredComments: [String: Comment]?
    
    enum CodingKeys: String, CodingKey {
        case filteredComments = "filtered_comments"
        
        case posts,
             users,
             topics,
             widgets
    }
}
