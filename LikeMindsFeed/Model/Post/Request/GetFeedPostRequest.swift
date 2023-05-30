//
//  GetFeedPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetFeedPostRequest: Encodable {
    public var page: Int
    public var pageSize: Int = 10
    
    public init(page: Int) {
        self.page = page
    }
    
    public func pageSize(_ pageSize: Int) -> GetFeedPostRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case page = "page"
    }
}
