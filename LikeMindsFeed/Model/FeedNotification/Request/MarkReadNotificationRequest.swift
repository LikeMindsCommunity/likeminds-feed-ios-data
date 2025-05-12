//
//  MarkReadNotificationRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

public final class MarkReadNotificationRequest: Encodable {
    private(set) var activityId: String?
    
    private init(builder: Builder) {
        self.activityId = builder.activityId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var activityId: String?
        
        public init() { }
        
        /// Sets the activity ID
        /// - Parameter activityId: ID of the notification activity to mark as read
        /// - Returns: Builder instance for method chaining
        public func activityId(_ activityId: String) -> Builder {
            self.activityId = activityId
            return self
        }
        
        /// Builds the MarkReadNotificationRequest instance
        /// - Returns: Configured MarkReadNotificationRequest
        public func build() -> MarkReadNotificationRequest {
            return MarkReadNotificationRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let activityId = self.activityId {
            builder = builder.activityId(activityId)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case activityId = "activity_id"
    }
}
