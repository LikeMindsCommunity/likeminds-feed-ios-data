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
//        AWSS3Manager().initializeS3()
    }
    
    func saveExtrasValuesInLocalPreferences(extras: LMChatClient) {
        let preferences = PreferencesFactory.userPreferences()
        preferences.put(extras.getApiKey(), forKey: kPrefSdkApiKey)
        if let deviceId = extras.getDeviceId() {
            preferences.put(deviceId, forKey: kPrefDeviceUDID)
        }
        if let domain = extras.getDomainUrl() {
            preferences.put(domain, forKey: kPrefDomainUrl)
        }
        _ = preferences.save()
    }
    
    public func initiateUser(request: InitiateUserRequest, response: LMFeedClientResponse<InitiateUserResponse>?) {
        FeedClientServiceRequest.initiateChatService(request, withModuleName: moduleName) { result in
            FeedTokenManager.shared.accessToken = result.data?.accessToken
            FeedTokenManager.shared.refreshToken = result.data?.refreshToken
            response?(result)
        }
    }
    
    public func getFeed(_ request: GetFeedRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
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
    
    public func addComment(_ request: AddCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        LMFeedClientServiceRequest.addComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func replyComment(_ request: ReplyCommentRequest, _ response:  LMFeedClientResponse<ReplyCommentResponse>?) {
        LMFeedClientServiceRequest.replyComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getComment(_ request: GetCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        LMFeedClientServiceRequest.getComment(request, withModuleName: moduleName) { result in
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
    
    public func getMemberState(_ response:  LMFeedClientResponse<GetMemberStateResponse>?) {
        LMFeedClientServiceRequest.getMemberState(withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    func getFeedRoom(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {
        
    }
    
    public func getFeedOfFeedRoom(_ request: GetFeedOfFeedRoomRequest, _ response:  LMFeedClientResponse<GetFeedOfFeedRoomResponse>?) {
        LMFeedClientServiceRequest.getFeedOfFeedRoom(request, withModuleName: moduleName) { result in
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
    
    public func getTaggingList(_ request: GetTaggingListRequest, _ response:  LMFeedClientResponse<GetTaggingListResponse>?) {
        LMFeedClientServiceRequest.getTaggingList(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func registerDevice(request: RegisterDeviceRequest, response: LMFeedClientResponse<RegisterDeviceResponse>?) {
        FeedClientServiceRequest.registerDevice(request: request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func logout(request: LogoutRequest, response: LMFeedClientResponse<NoData>?) {
        FeedClientServiceRequest.logout(request: request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func pinPost(_ request: PinPostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.pinPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func editPost(_ request: EditPostRequest, _ response:  LMFeedClientResponse<EditPostResponse>?) {
        LMFeedClientServiceRequest.editPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func editComment(_ request: EditCommentRequest, _ response:  LMFeedClientResponse<EditCommentResponse>?) {
        LMFeedClientServiceRequest.editComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func markReadNotification(_ request: MarkReadNotificationRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedClientServiceRequest.markReadNotification(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getUnreadNotificationCount(_ response:  LMFeedClientResponse<GetUnreadNotificationCountResponse>?) {
        LMFeedClientServiceRequest.getNotificationFeedUnreadCount(withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getNotificationFeed(_ request: GetNotificationFeedRequest, _ response:  LMFeedClientResponse<GetNotificationFeedResponse>?) {
        LMFeedClientServiceRequest.getNotificationFeed(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getAllMembers(_ request: GetAllMembersRequest, _ response:  LMFeedClientResponse<GetAllMembersResponse>?) {
        LMFeedClientServiceRequest.getAllMembers(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func searchMembers(_ request: SearchMembersRequest, _ response:  LMFeedClientResponse<SearchMembersResponse>?) {
        LMFeedClientServiceRequest.searchMembers(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
}
