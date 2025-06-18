//
//  DeletePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class DeletePostRequest: Encodable {
    private(set) var postId: String?
    private(set) var reason: String?
    
    private init(builder: Builder) {
        self.postId = builder.postId
        self.reason = builder.reason
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        var reason: String?
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post to delete
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the delete reason
        /// - Parameter reason: Reason for deleting the post
        /// - Returns: Builder instance for method chaining
        public func deleteReason(_ reason: String?) -> Builder {
            self.reason = reason
            return self
        }
        
        /// Builds the DeletePostRequest instance
        /// - Returns: Configured DeletePostRequest
        public func build() -> DeletePostRequest {
            return DeletePostRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        if let reason = self.reason {
            builder = builder.deleteReason(reason)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case reason = "delete_reason"
    }
}
