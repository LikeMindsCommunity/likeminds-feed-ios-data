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
        let entityType = ReportRequest("test", "ty", .post)
        print(entityType.requestParam())
        LMClient.shared.initiateUser(request: request) { result in
            response?(result)
        }
    }
    
    public func getFeeds(_ request: GetFeedRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        LMFeedServiceRequest.getFeeds(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func addPost(_ request: AddPostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.addPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getPost(_ request: GetPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {
        LMFeedServiceRequest.getPost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getPostLikes(_ request: GetPostLikesRequest, _ response:  LMFeedClientResponse<GetPostLikeResponse>?) {
        LMFeedServiceRequest.getPostLikes(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func deletePost(_ request: DeletePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.deletePost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func likePost(_ request: LikePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.likePost(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func addComment(_ request: AddCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.addComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func replyOnComment(_ request: ReplyOnCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.replyOnComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getComment(_ request: GetCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        LMFeedServiceRequest.getComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getRepliesOnComment(_ request: GetRepliesOnCommentRequest, _ response:  LMFeedClientResponse<GetRepliesResponse>?) {
        LMFeedServiceRequest.getRepliesOnComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getCommentLikes(_ request: GetCommentLikesRequest, _ response:  LMFeedClientResponse<GetCommentsLikeResponse>?) {
        LMFeedServiceRequest.getCommentLikes(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func likeComment(_ request: LikeCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        LMFeedServiceRequest.likeComment(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getMemberState(_ request: GetMemberStateRequest, _ response:  LMFeedClientResponse<GetMemberStateResponse>?) {
        LMFeedServiceRequest.getMemberState(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getFeedRoom(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {
        
    }
    
    public func getFeedOfFeedRoom(_ request: GetFeedGroupRequest, _ response:  LMFeedClientResponse<GetFeedGroupResponse>?) {
        LMFeedServiceRequest.getFeedGroup(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getNotificationFeed(_ request: GetFeedNotificationRequest, _ response:  LMFeedClientResponse<GetFeedNotificationResponse>?) {
        LMFeedServiceRequest.getNotificationFeed(request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func attachmentUpload(url: String) {
       print(url)
        do {
            let imagedata = try Data(contentsOf: URL(string: url)!)
            let image = UIImage(data: imagedata)
            print(imagedata)
            print(image)
        } catch let error {
            print(error)
        }
    }
    
}
