//
//  GetPostLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetPostLikesRequest: Encodable {
    var postId: String?
    var pageSize: Int = 10 //
    var page: Int = 1
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetPostLikesRequest {
        return GetPostLikesRequest()
    }
    
    public func build() -> GetPostLikesRequest {
        return self
    }
    
    public func postId(_ postId: String) -> GetPostLikesRequest {
        self.postId = postId
        return self
    }
    
    public func page(_ page: Int) -> GetPostLikesRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetPostLikesRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case page
        case pageSize = "page_size"
    }
}
