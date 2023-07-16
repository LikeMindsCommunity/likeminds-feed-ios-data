//
//  DeleteCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public class DeleteCommentRequest: Encodable {
    var postId: String?
    var commentId: String?
    var reason: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> DeleteCommentRequest {
        return DeleteCommentRequest()
    }
    
    public func build() -> DeleteCommentRequest {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
        case reason = "delete_reason"
    }
    
    public func postId(_ postId: String) -> DeleteCommentRequest {
        self.postId = postId
        return self
    }
    
    public func commentId(_ commentId: String) -> DeleteCommentRequest {
        self.commentId = commentId
        return self
    }
    
    public func deleteReason(_ reason: String?) -> DeleteCommentRequest {
        self.reason = reason
        return self
    }
}
