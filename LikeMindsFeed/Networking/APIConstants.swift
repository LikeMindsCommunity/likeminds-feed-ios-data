//
//  APIConstants.swift
//  Pods
//
//  Created by Devansh Mohata on 19/08/24.
//

import Foundation

enum APIConstants {
    static var baseURL: String {
        switch BuildManager.environment {
        case .production:
            return "https://auth.likeminds.community/"
        case .devtest:
            return "https://betaauth.likeminds.community/"
        }
    }
    
    // MARK: - Endpoints
    enum Endpoint {
        // User related
        static let initiateSDK = "sdk/initiate"
        static let memberState = "community/member/state"
        static let logout = "user/logout"
        static let registerDevice = "user/device/push"
        static let refreshToken = "user/refresh"
        static let validateUser = "sdk/initiate"
        static let communityConfig = "community/configurations"
        
        // Post related
        static let universalFeed = "feed/universal"
        static let post = "feed/post"
        static let search = "search/post"
        
        // Comment related
        static let comment = "comment"
        
        // Notification related
        static let notification = "feed/user/activity"
        static let notificationCount = "\(notification)/unread_count"
        
        // Topic related
        static let topic = "feed/topic"
        
        // Misc
        static let report = "community/report"
        static let reportTag = "community/report/tag"
        static let decodeURL = "helper/url"
        static let tagging = "community/tag"
        
        // Poll related
        static let poll = "poll"
    }
        
    // MARK: - Query Parameters
    enum QueryParam {
        static let page = "page"
        static let pageSize = "page_size"
        static let search = "search"
        static let searchType = "search_type"
        static let searchName = "search_name"
        static let topicIds = "topic_ids"
        static let isEnabled = "is_enabled"
        static let configurationType = "configuration_types"
        static let url = "url"
        static let type = "type"
        static let userName = "user_name"
        static let uuid = "uuid"
        static let isGuest = "is_guest"
        static let votes = "votes"
    }
    
    
    // MARK: Body Keys
    enum Body {
        static let refreshToken = "refresh_token"
        static let token = "token"
        static let entityID = "entity_id"
        static let uuid = "uuid"
        static let entityType = "entity_type"
        static let tagID = "tag_id"
        static let reason = "reason"
        static let type = "type"
        static let deleteReason = "delete_reason"
        static let votes = "votes"
        static let text = "text"
    }
    
    // MARK: - Header Keys
    enum HeaderKey {
        static let authorization = "Authorization"
        static let deviceId = "x-device-id"
        static let platform = "x-platform-code"
        static let versionCode = "x-version-code"
        static let sdkSource = "x-sdk-source"
        static let apiKey = "x-api-key"
        
        static let platformCode = "ios"
        static let sdkSourceCode = "feed"
    }
}

// MARK: - Helper Methods
extension APIConstants {
    static func postEndpoint(for postId: String) -> String {
        return Endpoint.post + "/\(postId)"
    }
    
    static func likePostEndpoint(for postId: String) -> String {
        "\(Self.pollEndpoint(for: postId))/like"
    }
    
    static func savePostEndpoint(for postId: String) -> String {
        "\(postEndpoint(for: postId))/save"
    }
    
    static func pinPostEndpoint(for postId: String) -> String {
        "\(postEndpoint(for: postId))/pin"
    }
    
    static func commentEndpoint(for postId: String, commentId: String? = nil) -> String {
        var endpoint = postEndpoint(for: postId) + "/\(Endpoint.comment)"
        if let commentId = commentId {
            endpoint += "/\(commentId)"
        }
        return endpoint
    }
    
    static func pollEndpoint(for pollId: String) -> String {
        return Endpoint.poll + "/\(pollId)"
    }
    
    static func pollVoteEndpoint(for pollId: String) -> String {
        "\(pollEndpoint(for: pollId))/vote"
    }
    
    static func markRead(for activityId: String) -> String {
        "\(Endpoint.notification)/\(activityId)/mark_read"
    }
}
