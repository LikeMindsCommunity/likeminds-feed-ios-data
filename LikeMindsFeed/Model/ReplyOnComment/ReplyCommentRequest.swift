//
//  ReplyOnCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

public class ReplyCommentRequest: Encodable {
    var text: String?
    var postId: String?
    var commentId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> ReplyCommentRequest {
        return ReplyCommentRequest()
    }
    
    public func build() -> ReplyCommentRequest {
        return self
    }
    
    public func postId(_ postId: String) -> ReplyCommentRequest {
        self.postId = postId
        return self
    }
    
    public func commentId(_ commentId: String) -> ReplyCommentRequest {
        self.commentId = commentId
        return self
    }
    
    public func text(_ text: String?) -> ReplyCommentRequest {
        self.text = text
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case commentId = "comment_id"
    }
    
}
