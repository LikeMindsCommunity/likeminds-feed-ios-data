//
//  GetCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetCommentRequest: Encodable {
    var postId: String
    var commentId: String
    var page: Int = 1
    var pageSize: Int = 10
    
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
    
    public func page(_ page: Int) -> GetCommentRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetCommentRequest {
        self.pageSize = pageSize
        return self
    }
}
