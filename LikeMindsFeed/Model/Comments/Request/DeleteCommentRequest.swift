//
//  DeleteCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public class DeleteCommentRequest: Encodable {
    public let postId: String
    public let commentId: String
    public var reason: String?
    
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
        case reason = "delete_reason"
    }
    
    public func deleteReason(_ reason: String?) -> DeleteCommentRequest {
        self.reason = reason
        return self
    }
}
