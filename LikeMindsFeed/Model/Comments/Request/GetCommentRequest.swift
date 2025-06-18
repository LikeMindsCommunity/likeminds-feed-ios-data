//
//  GetCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class GetCommentRequest: Encodable {
    private(set) var postId: String?
    private(set) var commentId: String?
    private(set) var page: Int
    private(set) var pageSize: Int
    
    private init(builder: Builder) {
        self.postId = builder.postId
        self.commentId = builder.commentId
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var postId: String?
        var commentId: String?
        var page: Int = 1
        var pageSize: Int = 10
        
        public init() { }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the comment ID
        /// - Parameter commentId: ID of the comment
        /// - Returns: Builder instance for method chaining
        public func commentId(_ commentId: String) -> Builder {
            self.commentId = commentId
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
        
        /// Builds the GetCommentRequest instance
        /// - Returns: Configured GetCommentRequest
        public func build() -> GetCommentRequest {
            return GetCommentRequest(builder: self)
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
        builder = builder.page(self.page)
            .pageSize(self.pageSize)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
        case page
        case pageSize = "page_size"
    }
}
