//
//  LMFeedClient+Extension.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 24/02/23.
//

import Foundation
import UIKit

public typealias LMFeedClientResponse<T: Decodable> = (LMResponse<T>) -> (Void)

extension LMFeedClient {
    
    func initialize() {
        AWSS3Manager().initializeS3()
    }
    
    func saveExtrasValuesInLocalPreferences(extras: LMChatClient) {
        let preferences = PreferencesFactory.userPreferences()
        preferences.put(extras.getApiKey(), forKey: kPrefSdkApiKey)
        if let domain = extras.getDomainUrl() {
            preferences.put(domain, forKey: kPrefDomainUrl)
        }
        _ = preferences.save()
    }
    
    public func initiateUser(_ request: InitiateUserRequest, _ response: LMFeedClientResponse<InitiateUserResponse>?) {
        LMClient.shared.initiateUser(request: request) { result in
            response?(result)
        }
    }
    
    public func getFeeds(_ request: GetFeedRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        LMFeedClientServiceRequest.getUniversalFeeds(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func addPost(_ request: AddPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {
        LMFeedClientServiceRequest.addPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getPost(_ request: GetPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {
        LMFeedClientServiceRequest.getPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getPostLikes(_ request: GetPostLikesRequest, _ response:  LMFeedClientResponse<GetPostLikeResponse>?) {
        LMFeedClientServiceRequest.getPostLikes(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func deletePost(_ request: DeletePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.deletePost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func deleteComment(_ request: DeleteCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.deleteComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func likePost(_ request: LikePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.likePost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func savePost(_ request: SavePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.savePost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func addComment(_ request: AddCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.addComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func replyOnComment(_ request: ReplyOnCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.replyOnComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getComment(_ request: GetCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        LMFeedClientServiceRequest.getComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getRepliesOnComment(_ request: GetRepliesOnCommentRequest, _ response:  LMFeedClientResponse<GetRepliesResponse>?) {
        LMFeedClientServiceRequest.getRepliesOnComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getCommentLikes(_ request: GetCommentLikesRequest, _ response:  LMFeedClientResponse<GetCommentsLikeResponse>?) {
        LMFeedClientServiceRequest.getCommentLikes(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func likeComment(_ request: LikeCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.likeComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getMemberState(_ request: GetMemberStateRequest, _ response:  LMFeedClientResponse<GetMemberStateResponse>?) {
        LMFeedClientServiceRequest.getMemberState(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getFeedRoom(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {
        
    }
    
    public func getFeedOfFeedRoom(_ request: GetFeedOfFeedRoomRequest, _ response:  LMFeedClientResponse<GetFeedOfFeedRoomResponse>?) {
        LMFeedClientServiceRequest.getFeedOfFeedRoom(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getFeedNotifications(_ request: GetFeedNotificationRequest, _ response:  LMFeedClientResponse<GetFeedNotificationResponse>?) {
        LMFeedClientServiceRequest.getFeedNotifications(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func report(_ request: ReportRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.report(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func decodeUrl(_ request: DecodeUrlRequest, _ response: LMFeedClientResponse<DecodeUrlResponse>?) {
        LMFeedClientServiceRequest.getOGTags(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getReportTags(_ request: GetReportTagRequest, _ response:  LMFeedClientResponse<GetReportTagResponse>?) {
        LMFeedClientServiceRequest.getReportTags(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
}
