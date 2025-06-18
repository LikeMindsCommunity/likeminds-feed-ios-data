//
//  EditCommentRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public final class EditCommentRequest: Encodable {
    private(set) var text: String?
    private(set) var postId: String?
    private(set) var commentId: String?
    
    private init(builder: Builder) {
        self.text = builder.text
        self.postId = builder.postId
        self.commentId = builder.commentId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var text: String?
        var postId: String?
        var commentId: String?
        
        public init() { }
        
        /// Sets the comment text
        /// - Parameter text: Text content of the comment
        /// - Returns: Builder instance for method chaining
        public func text(_ text: String) -> Builder {
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
        /// - Parameter commentId: ID of the comment to edit
        /// - Returns: Builder instance for method chaining
        public func commentId(_ commentId: String) -> Builder {
            self.commentId = commentId
            return self
        }
        
        /// Builds the EditCommentRequest instance
        /// - Returns: Configured EditCommentRequest
        public func build() -> EditCommentRequest {
            return EditCommentRequest(builder: self)
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
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case commentId = "comment_id"
    }
}
