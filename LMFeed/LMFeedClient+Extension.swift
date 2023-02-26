//
//  LMFeedClient+Extension.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 24/02/23.
//

import Foundation

public typealias LMFeedClientResponse<T: Decodable> = (LMResponse<T>) -> (Void)

extension LMFeedClient {
    
    public func initiateUser(_ request: InitiateUserRequest, _ response: LMFeedClientResponse<InitiateUserResponse>?) {
        LMClient.shared.initiateUser(request: request) { result in
            response?(result)
        }
    }
    
    public func getFeeds(_ request: GetFeedRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        
    }
    
    public func addPost(_ request: AddPostRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func getPost(_ request: GetPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {}
    
    public func getPostLikes(_ request: GetPostLikesRequest, _ response:  LMFeedClientResponse<GetPostLikeResponse>?) {}
    
    public func deletePost(_ request: DeletePostRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func likePost(_ request: LikePostRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func addComment(_ request: AddCommentRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func getComments(_ request: GetCommentRequest, _ response:  LMFeedClientResponse<GetCommentsResponse>?) {}
    
    public func getCommentLikes(_ request: GetCommentLikesRequest, _ response:  LMFeedClientResponse<GetCommentsLikeResponse>?) {}
    
    public func likeComment(_ request: LikeCommentRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func getMemberState(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func getFeedRoom(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>?) {}
    
    public func getFeedOfFeedRoom(_ request: GetFeedRequest, _ response:  LMFeedClientResponse<GetFeedResponse>??) {}
    
}
