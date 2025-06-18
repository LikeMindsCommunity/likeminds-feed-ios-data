//
//  GetFeedPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class GetFeedPostRequest: Encodable {
    private(set) var page: Int = 1
    private(set) var pageSize: Int = 10
    
    private init(builder: Builder) {
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var page: Int = 1
        var pageSize: Int = 10
        
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
        
        /// Builds the GetFeedPostRequest instance
        /// - Returns: Configured GetFeedPostRequest
        public func build() -> GetFeedPostRequest {
            return GetFeedPostRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.page(self.page)
        builder = builder.pageSize(self.pageSize)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case page
    }
}
