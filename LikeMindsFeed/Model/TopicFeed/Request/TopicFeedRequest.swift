//
//  TopicFeedRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 19/09/23.
//

import Foundation

public final class TopicFeedRequest: Encodable {
    private(set) var isEnabled: Bool = false
    private(set) var search: String?
    private(set) var searchType: String = "name"
    private(set) var page: Int = 1
    private(set) var pageSize: Int = 10
    
    private init(builder: Builder) {
        self.isEnabled = builder.isEnabled
        self.search = builder.search
        self.searchType = builder.searchType
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var isEnabled: Bool = false
        var search: String?
        var searchType: String = "name"
        var page: Int = 1
        var pageSize: Int = 10
        
        public init() { }
        
        /// Sets the search query
        /// - Parameter search: Search text
        /// - Returns: Builder instance for method chaining
        public func setSearchTopic(_ search: String) -> Builder {
            self.search = search
            return self
        }
        
        /// Sets the search type
        /// - Parameter searchType: Type of search (default: "name")
        /// - Returns: Builder instance for method chaining
        public func setSearchType(_ searchType: String) -> Builder {
            self.searchType = searchType
            return self
        }
        
        /// Sets the enabled state
        /// - Parameter isEnabled: Whether the topic feed is enabled
        /// - Returns: Builder instance for method chaining
        public func setEnableState(_ isEnabled: Bool) -> Builder {
            self.isEnabled = isEnabled
            return self
        }
        
        /// Sets the page number
        /// - Parameter page: Page number for pagination (default: 1)
        /// - Returns: Builder instance for method chaining
        public func setPage(_ page: Int) -> Builder {
            self.page = page
            return self
        }
        
        /// Sets the page size
        /// - Parameter pageSize: Number of items per page (default: 10)
        /// - Returns: Builder instance for method chaining
        public func setPageSize(_ pageSize: Int) -> Builder {
            self.pageSize = pageSize
            return self
        }
        
        /// Builds the TopicFeedRequest instance
        /// - Returns: Configured TopicFeedRequest
        public func build() -> TopicFeedRequest {
            return TopicFeedRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.setEnableState(self.isEnabled)
        if let search = self.search {
            builder = builder.setSearchTopic(search)
        }
        builder = builder.setSearchType(self.searchType)
        builder = builder.setPage(self.page)
        builder = builder.setPageSize(self.pageSize)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case isEnabled = "is_enabled"
        case search
        case searchType = "search_type"
        case page
        case pageSize = "page_size"
    }
}
