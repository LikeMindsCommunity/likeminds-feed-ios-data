//
//  GetTaggingListRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 10/05/23.
//

import Foundation

public final class GetTaggingListRequest: Encodable {
    private(set) var searchName: String = ""
    private(set) var pageSize: Int = 10
    private(set) var page: Int = 1
    
    private init(builder: Builder) {
        self.searchName = builder.searchName
        self.pageSize = builder.pageSize
        self.page = builder.page
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var searchName: String = ""
        var pageSize: Int = 10
        var page: Int = 1
        
        public init() { }
        
        /// Sets the search name
        /// - Parameter searchName: Name to search for in the tagging list
        /// - Returns: Builder instance for method chaining
        public func searchName(_ searchName: String) -> Builder {
            self.searchName = searchName
            return self
        }
        
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
        
        /// Builds the GetTaggingListRequest instance
        /// - Returns: Configured GetTaggingListRequest
        public func build() -> GetTaggingListRequest {
            return GetTaggingListRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.searchName(self.searchName)
        builder = builder.page(self.page)
        builder = builder.pageSize(self.pageSize)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case searchName = "search_name"
        case page
        case pageSize = "page_size"
    }
}
