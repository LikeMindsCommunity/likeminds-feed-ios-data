//
//  GetFeedGroupRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

public final class GetFeedOfFeedRoomRequest: Encodable {
    private(set) var feedroomId: String
    
    private init(builder: Builder) {
        self.feedroomId = builder.feedroomId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var feedroomId: String
        
        public init() {
            self.feedroomId = ""
        }
        
        /// Sets the feedroom ID
        /// - Parameter feedroomId: ID of the feedroom to get feed for
        /// - Returns: Builder instance for method chaining
        public func feedroomId(_ feedroomId: String) -> Builder {
            self.feedroomId = feedroomId
            return self
        }
        
        /// Builds the GetFeedOfFeedRoomRequest instance
        /// - Returns: Configured GetFeedOfFeedRoomRequest
        public func build() -> GetFeedOfFeedRoomRequest {
            return GetFeedOfFeedRoomRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.feedroomId(self.feedroomId)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case feedroomId = "feedroom_id"
    }
}
