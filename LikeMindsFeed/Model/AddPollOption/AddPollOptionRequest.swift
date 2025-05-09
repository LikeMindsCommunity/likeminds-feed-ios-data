//
//  AddPollOptionRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 12/06/24.
//

import Foundation

public final class AddPollOptionRequest: Encodable {
    private(set) var pollID: String
    private(set) var pollText: String
    
    private init(builder: Builder) {
        self.pollID = builder.pollID
        self.pollText = builder.pollText
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var pollID: String = ""
        var pollText: String = ""
        
        public init() { }
        
        /// Sets the poll ID
        /// - Parameter pollID: ID of the poll
        /// - Returns: Builder instance for method chaining
        public func pollID(_ pollID: String) -> Builder {
            self.pollID = pollID
            return self
        }
        
        /// Sets the poll option text
        /// - Parameter pollText: Text for the poll option
        /// - Returns: Builder instance for method chaining
        public func pollText(_ pollText: String) -> Builder {
            self.pollText = pollText
            return self
        }
        
        /// Builds the AddPollOptionRequest instance
        /// - Returns: Configured AddPollOptionRequest
        public func build() -> AddPollOptionRequest {
            return AddPollOptionRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.pollID(self.pollID)
            .pollText(self.pollText)
        return builder
    }
    
    /// Coding keys for JSON encoding
    enum CodingKeys: String, CodingKey {
        case pollID = "poll_id"
        case pollText = "text"
    }
}
