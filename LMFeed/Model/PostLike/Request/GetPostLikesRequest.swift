//
//  GetPostLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetPostLikesRequest: Encodable {
    var postId: String
    var pageSize: Int = 10 //
    var page: Int = 1
    
    public init(postId: String, page: Int) {
        self.postId = postId
        self.page = page
    }
    
    func page(_ page: Int) -> GetPostLikesRequest {
        self.page = page
        return self
    }
    
    func pageSize(_ pageSize: Int) -> GetPostLikesRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case page
        case pageSize = "page_size"
    }
}
