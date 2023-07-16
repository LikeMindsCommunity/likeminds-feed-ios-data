//
//  LikeCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class LikeCommentRequest: Encodable {
    var postId: String?
    var commentId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> LikeCommentRequest {
        return LikeCommentRequest()
    }
    
    public func build() -> LikeCommentRequest {
        return self
    }
    
    public func postId(_ postId: String) -> LikeCommentRequest {
        self.postId = postId
        return self
    }
    
    public func commentId(_ commentId: String) -> LikeCommentRequest {
        self.commentId = commentId
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
}
