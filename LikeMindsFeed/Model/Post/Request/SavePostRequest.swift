//
//  SavePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 03/04/23.
//

import Foundation

public final class SavePostRequest: Encodable {
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
        /// - Parameter postId: ID of the post to save
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Builds the SavePostRequest instance
        /// - Returns: Configured SavePostRequest
        public func build() -> SavePostRequest {
            return SavePostRequest(builder: self)
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
