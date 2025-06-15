//
//  Constant.swift
//  LikeMindsFeed
//
//  Created by Arpit Verma on 07/05/25.
//

import Foundation

/// A singleton class that provides access to constants used throughout the SDK.
/// This includes API endpoints and parameter keys.
public final class Constant {
  /// The shared singleton instance of `Constant`.
  public static let shared = Constant()

  /// The endpoints singleton instance.
  public let paths = Paths.shared

  /// The keys singleton instance.
  public let keys = Keys.shared

  /// Private initializer to enforce singleton pattern.
  private init() {}
}

/// A singleton class that contains all API endpoints used in the SDK.
public final class Paths {
    public static let shared = Paths()
    
    // MARK: - Feed APIs
    let universalFeed = "/feed/universal"
    let post = "/feed/post"
    let searchPost = "/search/post"
    let feedGroup = "/feed/group"
    
    // MARK: - Community APIs
    let communityConfigurations = "/community/configurations"
    let communityMemberState = "/community/member/state"
    let communityReport = "/community/report"
    let communityReportTag = "/community/report/tag"
    let communityMember = "/community/member"
    let communityMemberSearch = "/community/member/search"
    let communityTag = "/community/tag"
    
    // MARK: - Poll APIs
    let poll = "/poll"
    let pollVote = "/poll/vote"
    
    // MARK: - User APIs
    let userRefresh = "/user/refresh"
    let userDevicePush = "/user/device/push"
    let userLogout = "/user/logout"
    let userActivity = "/feed/user/activity"
    let userActivityUnreadCount = "/feed/user/activity/unread_count"
    
    // MARK: - SDK APIs
    let sdkInitiate = "/sdk/initiate"
    let sdkOnboarding = "/sdk/onboarding"
    
    // MARK: - Helper APIs
    let helperUrl = "/helper/url"
    
    // MARK: - Topic APIs
    let topicFeed = "/feed/topic"
    
    // MARK: - Path Getters
    func getPostPath(postId: String) -> String {
        return "\(post)/\(postId)"
    }
    
    func getPostCommentPath(postId: String, commentId: String) -> String {
        return "\(post)/\(postId)/comment/\(commentId)"
    }
    
    func getAddPostCommentPath(postId: String) -> String {
        return "\(post)/\(postId)/comment"
    }
    
    func getPostCommentReplyPath(postId: String, commentId: String) -> String {
        return "\(post)/\(postId)/comment/\(commentId)/comment"
    }
    
    func getPostLikePath(postId: String) -> String {
        return "\(post)/\(postId)/like"
    }
    
    func getCommentLikePath(postId: String, commentId: String) -> String {
        return "\(post)/\(postId)/comment/\(commentId)/like"
    }
    
    func getPostSavePath(postId: String) -> String {
        return "\(post)/\(postId)/save"
    }
    
    func getPostPinPath(postId: String) -> String {
        return "\(post)/\(postId)/pin"
    }
    
    func getPollVotePath(pollId: String) -> String {
        return "/poll/\(pollId)/vote"
    }
    
    func getPollPath(pollId: String) -> String {
        return "\(poll)/\(pollId)"
    }
    
    func getActivityMarkReadPath(activityId: String) -> String {
        return "\(userActivity)/\(activityId)/mark_read"
    }
}

/// A singleton class that contains all parameter keys used in API requests.
public final class Keys {
  /// The shared singleton instance of `Keys`.
  public static let shared = Keys()

  // MARK: - Common Query Parameters
  public let page = "page"
  public let pageSize = "page_size"
  public let search = "search"
  public let searchType = "search_type"
public let startFeedWithPostIds = "post_ids"

  // MARK: - Feed Parameters
  public let postId = "post_id"
  public let commentId = "comment_id"
  public let topicIds = "topic_ids"
  public let isEnabled = "is_enabled"
  public let feedroomId = "feedroom_id"
  public let activityId = "activity_id"

  // MARK: - Poll Parameters
  public let pollId = "poll_id"
  public let votes = "votes"
  public let options = "options"
  public let pollText = "text"

  // MARK: - Community Parameters
  public let configurationTypes = "configuration_types"
  public let memberState = "member_state"
  public let searchName = "search_name"
  public let type = "type"

  // MARK: - Helper Parameters
  public let url = "url"

  /// Private initializer to enforce singleton pattern.
  private init() {}
}
