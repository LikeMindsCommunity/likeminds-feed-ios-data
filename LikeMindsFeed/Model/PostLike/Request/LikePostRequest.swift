//
//  LikePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class LikePostRequest: Encodable {
    private(set) var postId: String?
    
    private init(builder: Builder) {
        self.postId = builder.postId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post to like
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Builds the LikePostRequest instance
        /// - Returns: Configured LikePostRequest
        public func build() -> LikePostRequest {
            return LikePostRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
