//
//  GetFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public class GetFeedRequest: Encodable {
    var page: Int = 1 //page number of home feed chat
    var pageSize: Int = 10
    var topics: [String] = []
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetFeedRequest {
        return GetFeedRequest()
    }
    
    public func build() -> GetFeedRequest {
        return self
    }
    
    public func page(_ page: Int) -> GetFeedRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetFeedRequest {
        self.pageSize = pageSize
        return self
    }
    
    public func topics(_ topics: [String]) -> GetFeedRequest {
        self.topics = topics
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size",
             topics = "topic_ids",
             page
    }
}
