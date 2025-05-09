//
//  GetPollVotesRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/06/24.
//

import Foundation

public final class GetPollVotesRequest: Encodable {
    private(set) var pollID: String
    private(set) var options: [String]
    private(set) var page: Int
    private(set) var pageSize: Int
    
    private init(builder: Builder) {
        self.pollID = builder.pollID
        self.options = builder.options
        self.page = builder.page
        self.pageSize = builder.pageSize
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var pollID: String = ""
        var options: [String] = []
        var page: Int = 1
        var pageSize: Int = 10
        
        public init() { }
        
        /// Sets the poll ID
        /// - Parameter pollID: ID of the poll
        /// - Returns: Builder instance for method chaining
        public func pollID(_ pollID: String) -> Builder {
            self.pollID = pollID
            return self
        }
        
        /// Sets the poll options
        /// - Parameter options: Array of option IDs
        /// - Returns: Builder instance for method chaining
        public func options(_ options: [String]) -> Builder {
            self.options = options
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
        
        /// Builds the GetPollVotesRequest instance
        /// - Returns: Configured GetPollVotesRequest
        public func build() -> GetPollVotesRequest {
            return GetPollVotesRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.pollID(self.pollID)
            .options(self.options)
            .page(self.page)
            .pageSize(self.pageSize)
        return builder
    }
    
    /// Coding keys for JSON encoding
    enum CodingKeys: String, CodingKey {
        case pollID = "poll_id"
        case options
        case page
        case pageSize = "page_size"
    }
}
