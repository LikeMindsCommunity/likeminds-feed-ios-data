//
//  GetOGTagsRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public final class DecodeUrlRequest: Encodable {
    private(set) var link: String?
    
    private init(builder: Builder) {
        self.link = builder.link
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var link: String?
        
        public init() { }
        
        /// Sets the URL to decode
        /// - Parameter link: URL to decode for OG tags
        /// - Returns: Builder instance for method chaining
        public func link(_ link: String) -> Builder {
            self.link = link
            return self
        }
        
        /// Builds the DecodeUrlRequest instance
        /// - Returns: Configured DecodeUrlRequest
        public func build() -> DecodeUrlRequest {
            return DecodeUrlRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let link = self.link {
            builder = builder.link(link)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case link = "url"
    }
}
