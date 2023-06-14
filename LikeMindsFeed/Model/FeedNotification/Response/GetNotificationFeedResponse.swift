//
//  GetNotificationFeedResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - GetNotificationFeedResponse

public struct GetNotificationFeedResponse: Decodable {
    public let activities: [Activity]?
    public let users: [String: User]?
}
