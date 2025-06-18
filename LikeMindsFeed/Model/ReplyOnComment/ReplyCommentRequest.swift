//
//  ReplyOnCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

public final class ReplyCommentRequest: Encodable {
    private(set) var text: String?
    private(set) var postId: String?
    private(set) var commentId: String?
    private(set) var tempId: String?
    
    private init(builder: Builder) {
        self.text = builder.text
        self.postId = builder.postId
        self.commentId = builder.commentId
        self.tempId = builder.tempId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var text: String?
        var postId: String?
        var commentId: String?
        var tempId: String?
        
        public init() { }
        
        /// Sets the reply text
        /// - Parameter text: Text content of the reply
        /// - Returns: Builder instance for method chaining
        public func text(_ text: String?) -> Builder {
            self.text = text
            return self
        }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post containing the comment
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the comment ID
        /// - Parameter commentId: ID of the comment to reply to
        /// - Returns: Builder instance for method chaining
        public func commentId(_ commentId: String) -> Builder {
            self.commentId = commentId
            return self
        }
        
        /// Sets the temporary ID
        /// - Parameter tempId: Temporary ID for the reply
        /// - Returns: Builder instance for method chaining
        public func tempId(_ tempId: String?) -> Builder {
            self.tempId = tempId
            return self
        }
        
        /// Builds the ReplyCommentRequest instance
        /// - Returns: Configured ReplyCommentRequest
        public func build() -> ReplyCommentRequest {
            return ReplyCommentRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let text = self.text {
            builder = builder.text(text)
        }
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        if let commentId = self.commentId {
            builder = builder.commentId(commentId)
        }
        if let tempId = self.tempId {
            builder = builder.tempId(tempId)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case commentId = "comment_id"
        case tempId = "temp_id"
    }
}
