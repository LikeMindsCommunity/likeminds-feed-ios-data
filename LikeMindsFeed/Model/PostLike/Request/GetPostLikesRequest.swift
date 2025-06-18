//
//  GetPostLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class GetPostLikesRequest: Encodable {
    private(set) var postId: String?
    private(set) var pageSize: Int
    private(set) var page: Int
    
    private init(builder: Builder) {
        self.postId = builder.postId
        self.pageSize = builder.pageSize
        self.page = builder.page
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        var pageSize: Int = 10
        var page: Int = 1
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the page number
        /// - Parameter page: Page number for pagination
        /// - Returns: Builder instance for method chaining
        public func page(_ page: Int) -> Builder {
            self.page = page
            return self
        }
        
        /// Sets the page size
        /// - Parameter pageSize: Number of items per page
        /// - Returns: Builder instance for method chaining
        public func pageSize(_ pageSize: Int) -> Builder {
            self.pageSize = pageSize
            return self
        }
        
        /// Builds the GetPostLikesRequest instance
        /// - Returns: Configured GetPostLikesRequest
        public func build() -> GetPostLikesRequest {
            return GetPostLikesRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        builder = builder.page(self.page)
            .pageSize(self.pageSize)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case page
        case pageSize = "page_size"
    }
}
