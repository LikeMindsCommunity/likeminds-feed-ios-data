//
//  GetNotificationFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

public class GetNotificationFeedRequest: Encodable {
    var page: Int = 1
    var pageSize: Int = 20
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetNotificationFeedRequest {
        return GetNotificationFeedRequest()
    }
    
    public func build() -> GetNotificationFeedRequest {
        return self
    }
    
    public func page(_ page: Int) -> GetNotificationFeedRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetNotificationFeedRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageSize = "page_size"
    }
}
