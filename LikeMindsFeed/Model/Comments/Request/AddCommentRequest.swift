//
//  AddCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class AddCommentRequest: Encodable {
    private(set) var text: String?
    private(set) var postId: String?
    private(set) var tempId: String?

    private init(builder: Builder) {
        self.text = builder.text
        self.postId = builder.postId
        self.tempId = builder.tempId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var text: String?
        var postId: String?
        var tempId: String?
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the comment text
        /// - Parameter text: Text content of the comment
        /// - Returns: Builder instance for method chaining
        public func text(_ text: String) -> Builder {
            self.text = text
            return self
        }
        
        /// Sets the temporary ID
        /// - Parameter tempId: Temporary ID for the comment
        /// - Returns: Builder instance for method chaining
        public func tempId(_ tempId: String) -> Builder {
            self.tempId = tempId
            return self
        }
        
        /// Builds the AddCommentRequest instance
        /// - Returns: Configured AddCommentRequest
        public func build() -> AddCommentRequest {
            return AddCommentRequest(builder: self)
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
        if let tempId = self.tempId {
            builder = builder.tempId(tempId)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case tempId = "temp_id"
    }
}
