//
//  GetNotificationFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

public class GetNotificationFeedRequest: Encodable {
    var page: Int
    var pageSize: Int = 20
    
    public init(page: Int, pageSize: Int = 20) {
        self.page = page
        self.pageSize = pageSize
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
