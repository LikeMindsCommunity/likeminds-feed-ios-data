//
//  MarkReadNotificationRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

public class MarkReadNotificationRequest: Encodable {
    var activityId: String
    
    public init(activityId: String) {
        self.activityId = activityId
    }

    enum CodingKeys: String, CodingKey {
        case activityId = "activity_id"
    }
}
