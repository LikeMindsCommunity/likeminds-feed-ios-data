//
//  GetFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public final class GetFeedRequest: Encodable {
    private(set) var page: Int = 1
    private(set) var pageSize: Int = 10
    private(set) var topics: [String] = []
    private(set) var startFeedWithPostIds: [String] = []
    
    
    private init(builder: Builder) {
        self.page = builder.page
        self.pageSize = builder.pageSize
        self.topics = builder.topics
        self.startFeedWithPostIds = builder.startFeedWithPostIds
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var page: Int = 1
        var pageSize: Int = 10
        var topics: [String] = []
        var startFeedWithPostIds: [String] = []
        
        public init() { }
        
        /// Sets the page number
        /// - Parameter page: Page number for pagination (default: 1)
        /// - Returns: Builder instance for method chaining
        public func page(_ page: Int) -> Builder {
            self.page = page
            return self
        }
        
        /// Sets the page size
        /// - Parameter pageSize: Number of items per page (default: 10)
        /// - Returns: Builder instance for method chaining
        public func pageSize(_ pageSize: Int) -> Builder {
            self.pageSize = pageSize
            return self
        }
        
        /// Sets the topics
        /// - Parameter topics: Array of topic IDs
        /// - Returns: Builder instance for method chaining
        public func topics(_ topics: [String]) -> Builder {
            self.topics = topics
            return self
        }
        
        /// Sets the post IDs to start feed with
        /// - Parameter postIds: Array of post IDs to start feed with
        /// - Returns: Builder instance for method chaining
        public func startFeedWithPostIds(_ postIds: [String]) -> Builder {
            self.startFeedWithPostIds = postIds
            return self
        }
        
        /// Builds the GetFeedRequest instance
        /// - Returns: Configured GetFeedRequest
        public func build() -> GetFeedRequest {
            return GetFeedRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.page(self.page)
        builder = builder.pageSize(self.pageSize)
        builder = builder.topics(self.topics)
        builder = builder.startFeedWithPostIds(self.startFeedWithPostIds)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case topics = "topic_ids"
        case page
        case startFeedWithPostIds = "start_feed_with_post_ids"
    }
}
