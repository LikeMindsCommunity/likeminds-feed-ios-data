//
//  GetFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public class GetFeedRequest: Encodable {
    var page: Int //page number of home feed chat
    var pageSize: Int = 10
    
    /// Initiate method with userUniqueId key param
    public init(page: Int) {
        self.page = page
    }
    
    public func pageSize(_ pageSize: Int) -> GetFeedRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case page = "page"
    }
}
