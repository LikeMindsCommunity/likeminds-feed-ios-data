//
//  PinPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public final class PinPostRequest: Encodable {
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
        /// - Parameter postId: ID of the post to pin
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Builds the PinPostRequest instance
        /// - Returns: Configured PinPostRequest
        public func build() -> PinPostRequest {
            return PinPostRequest(builder: self)
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
