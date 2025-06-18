//
//  SearchMembersRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/09/23.
//

import Foundation

public final class SearchMembersRequest: Encodable {
    private(set) var page: Int = 1
    private(set) var pageSize: Int = 10
    private(set) var search: String?
    private(set) var searchType: String?
    
    private init(builder: Builder) {
        self.page = builder.page
        self.pageSize = builder.pageSize
        self.search = builder.search
        self.searchType = builder.searchType
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var page: Int = 1
        var pageSize: Int = 10
        var search: String?
        var searchType: String?
        
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
        
        /// Sets the search query
        /// - Parameter search: Search text
        /// - Returns: Builder instance for method chaining
        public func search(_ search: String) -> Builder {
            self.search = search
            return self
        }
        
        /// Sets the search type
        /// - Parameter searchType: Type of search
        /// - Returns: Builder instance for method chaining
        public func searchType(_ searchType: String) -> Builder {
            self.searchType = searchType
            return self
        }
        
        /// Builds the SearchMembersRequest instance
        /// - Returns: Configured SearchMembersRequest
        public func build() -> SearchMembersRequest {
            return SearchMembersRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.page(self.page)
        builder = builder.pageSize(self.pageSize)
        if let search = self.search {
            builder = builder.search(search)
        }
        if let searchType = self.searchType {
            builder = builder.searchType(searchType)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case page, search
        case pageSize = "page_size"
        case searchType = "search_type"
    }
}
