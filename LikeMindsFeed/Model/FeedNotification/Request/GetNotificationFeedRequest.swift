//
//  GetNotificationFeedRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

public final class GetNotificationFeedRequest: Encodable {
    private(set) var page: Int = 1
    private(set) var pageSize: Int = 20
    
    private init(builder: Builder) {
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var page: Int = 1
        var pageSize: Int = 20
        
        public init() { }
        
        /// Sets the page number
        /// - Parameter page: Page number for pagination (default: 1)
        /// - Returns: Builder instance for method chaining
        public func page(_ page: Int) -> Builder {
            self.page = page
            return self
        }
        
        /// Sets the page size
        /// - Parameter pageSize: Number of items per page (default: 20)
        /// - Returns: Builder instance for method chaining
        public func pageSize(_ pageSize: Int) -> Builder {
            self.pageSize = pageSize
            return self
        }
        
        /// Builds the GetNotificationFeedRequest instance
        /// - Returns: Configured GetNotificationFeedRequest
        public func build() -> GetNotificationFeedRequest {
            return GetNotificationFeedRequest(builder: self)
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
        case page
        case pageSize = "page_size"
    }
}
