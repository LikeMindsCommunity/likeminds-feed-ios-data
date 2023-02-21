//
//  GetPostLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetPostLikesRequest: Encodable {
    var postId: Int
    var pageSize: Int = 10 //
    var page: Int // Page no
    
    public init(postId: Int, page: Int) {
        self.postId = postId
        self.page = page
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
