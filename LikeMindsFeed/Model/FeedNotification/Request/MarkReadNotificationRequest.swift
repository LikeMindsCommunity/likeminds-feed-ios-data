//
//  MarkReadNotificationRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

public class MarkReadNotificationRequest: Encodable {
    var activityId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> MarkReadNotificationRequest {
        return MarkReadNotificationRequest()
    }
    
    public func build() -> MarkReadNotificationRequest {
        return self
    }
    
    public func activityId(_ activityId: String) -> MarkReadNotificationRequest {
        self.activityId = activityId
        return self
    }

    enum CodingKeys: String, CodingKey {
        case activityId = "activity_id"
    }
}
