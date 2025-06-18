//
//  LikeCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class LikeCommentRequest: Encodable {
    private(set) var postId: String?
    private(set) var commentId: String?
    
    private init(builder: Builder) {
        self.postId = builder.postId
        self.commentId = builder.commentId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        var commentId: String?
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post containing the comment
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the comment ID
        /// - Parameter commentId: ID of the comment to like
        /// - Returns: Builder instance for method chaining
        public func commentId(_ commentId: String) -> Builder {
            self.commentId = commentId
            return self
        }
        
        /// Builds the LikeCommentRequest instance
        /// - Returns: Configured LikeCommentRequest
        public func build() -> LikeCommentRequest {
            return LikeCommentRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        if let commentId = self.commentId {
            builder = builder.commentId(commentId)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
}
