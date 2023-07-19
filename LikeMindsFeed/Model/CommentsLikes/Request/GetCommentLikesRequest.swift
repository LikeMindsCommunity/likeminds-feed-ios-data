//
//  GetCommentLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetCommentLikesRequest: Encodable {
    var postId: String?
    var commentId: String?
    var page: Int = 1
    var pageSize: Int = 10
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetCommentLikesRequest {
        return GetCommentLikesRequest()
    }
    
    public func build() -> GetCommentLikesRequest {
        return self
    }
    
    public func postId(_ postId: String) -> GetCommentLikesRequest {
        self.postId = postId
        return self
    }
    
    public func commentId(_ commentId: String) -> GetCommentLikesRequest {
        self.commentId = commentId
        return self
    }
    
    public func page(_ page: Int) -> GetCommentLikesRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetCommentLikesRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
}
