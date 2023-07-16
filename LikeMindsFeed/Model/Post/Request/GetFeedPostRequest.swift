//
//  GetFeedPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetFeedPostRequest: Encodable {
    public var page: Int = 1
    public var pageSize: Int = 10
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetFeedPostRequest {
        return GetFeedPostRequest()
    }
    
    public func build() -> GetFeedPostRequest {
        return self
    }
    
    public func page(_ page: Int) -> GetFeedPostRequest {
        self.page = page
        return self
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
