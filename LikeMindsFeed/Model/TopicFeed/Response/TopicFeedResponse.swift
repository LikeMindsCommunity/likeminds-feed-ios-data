//
//  TopicFeedResponse.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 19/09/23.
//

import Foundation

public struct TopicFeedResponse: Decodable {
    public let topics: [TopicResponse]?
    
    public struct TopicResponse: Decodable {
        public let id: String?
        public let isEnabled: Bool?
        public let name: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "_id",
                 isEnabled = "is_enabled",
                 name
        }
    }
}
