//
//  GetPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 23/02/23.
//

import Foundation

public class GetPostRequest: Encodable {
    var postId: String?
    var page: Int = 1
    var pageSize: Int = 10
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetPostRequest {
        return GetPostRequest()
    }
    
    public func build() -> GetPostRequest {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case page = "page"
        case pageSize = "page_size"
    }
    
    public func postId(_ postId: String) -> GetPostRequest {
        self.postId = postId
        return self
    }
    
    public func page(_ page: Int) -> GetPostRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetPostRequest {
        self.pageSize = pageSize
        return self
    }
}
