//
//  GetCommentLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetCommentLikesRequest: Encodable {
    public var postId: String
    public var commentId: String
    public var page: Int = 1
    public var pageSize: Int = 10
    
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
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
