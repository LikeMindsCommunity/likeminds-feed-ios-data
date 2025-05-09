//
//  SearchPostsRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 29/06/24.
//

import Foundation

public class SearchPostsRequest: Encodable {
    private(set) var search: String
    private(set) var searchType: String
    private(set) var page: Int
    private(set) var pageSize: Int
    
    private init(builder: Builder) {
        self.search = builder.search
        self.searchType = builder.searchType
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var search: String = ""
        var searchType: String = "text"
        var page: Int = 1
        var pageSize: Int = 10
        
        public init() { }
        
        /// Sets the search query
        /// - Parameter search: Search text
        /// - Returns: Builder instance for method chaining
        public func search(_ search: String) -> Builder {
            self.search = search
            return self
        }
        
        /// Sets the search type
        /// - Parameter searchType: Type of search (default: "text")
        /// - Returns: Builder instance for method chaining
        public func searchType(_ searchType: String) -> Builder {
            self.searchType = searchType
            return self
        }
        
        /// Sets the page number for pagination
        /// - Parameter page: Page number (default: 1)
        /// - Returns: Builder instance for method chaining
        public func page(_ page: Int) -> Builder {
            self.page = page
            return self
        }
        
        /// Sets the page size for pagination
        /// - Parameter pageSize: Number of items per page (default: 10)
        /// - Returns: Builder instance for method chaining
        public func pageSize(_ pageSize: Int) -> Builder {
            self.pageSize = pageSize
            return self
        }
        
        /// Builds the SearchPostsRequest instance
        /// - Returns: Configured SearchPostsRequest
        public func build() -> SearchPostsRequest {
            return SearchPostsRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.search(self.search)
            .searchType(self.searchType)
            .page(self.page)
            .pageSize(self.pageSize)
        return builder
    }
    
    /// Coding keys for JSON encoding
    enum CodingKeys: String, CodingKey {
        case search
        case searchType = "search_type"
        case page
        case pageSize = "page_size"
    }
}

