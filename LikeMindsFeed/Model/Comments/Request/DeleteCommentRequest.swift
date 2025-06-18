//
//  DeleteCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public final class DeleteCommentRequest: Encodable {
    private(set) var postId: String?
    private(set) var commentId: String?
    private(set) var reason: String?
    
    private init(builder: Builder) {
        self.postId = builder.postId
        self.commentId = builder.commentId
        self.reason = builder.reason
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        var commentId: String?
        var reason: String?
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post containing the comment
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the comment ID
        /// - Parameter commentId: ID of the comment to delete
        /// - Returns: Builder instance for method chaining
        public func commentId(_ commentId: String) -> Builder {
            self.commentId = commentId
            return self
        }
        
        /// Sets the delete reason
        /// - Parameter reason: Reason for deleting the comment
        /// - Returns: Builder instance for method chaining
        public func deleteReason(_ reason: String?) -> Builder {
            self.reason = reason
            return self
        }
        
        /// Builds the DeleteCommentRequest instance
        /// - Returns: Configured DeleteCommentRequest
        public func build() -> DeleteCommentRequest {
            return DeleteCommentRequest(builder: self)
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
        if let reason = self.reason {
            builder = builder.deleteReason(reason)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
        case reason = "delete_reason"
    }
}
