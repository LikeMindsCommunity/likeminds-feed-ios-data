//
//  GetReportTagRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 13/04/23.
//

import Foundation

//public enum ReportTagType: Int {
//    case 
//}

public final class GetReportTagRequest: Encodable {
    private(set) var type: Int?
    
    private init(builder: Builder) {
        self.type = builder.type
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var type: Int?
        
        public init() { }
        
        /// Sets the report tag type
        /// - Parameter type: Type of report tag to fetch
        /// - Returns: Builder instance for method chaining
        public func type(_ type: Int) -> Builder {
            self.type = type
            return self
        }
        
        /// Builds the GetReportTagRequest instance
        /// - Returns: Configured GetReportTagRequest
        public func build() -> GetReportTagRequest {
            return GetReportTagRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let type = self.type {
            builder = builder.type(type)
        }
        return builder
    }
}
