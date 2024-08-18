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
    public func initiateUser(request: InitiateUserRequest, response: LMFeedClientResponse<InitiateUserResponse>?) {
        FeedClientServiceRequest.initiateChatService(request, withModuleName: moduleName) { result in
            if result.success {
                if result.data?.appAccess == true {
                    UserDetails.apiKey = request.apiKey
                    UserDetails.userDetails = result.data?.user
                    FeedTokenManager.shared.updateToken(result.data?.accessToken, result.data?.refreshToken)
                }
            }
            
            response?(result)
        }
    }
    
    public func getFeed(_ request: GetFeedRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        newManager.request(request: GetFeedAPIRequest(request: request)) { (result: LMResponse<GetFeedResponse>) in
            response?(result)
        }
    }
    
    public func addPost(_ request: AddPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {
        newManager.request(request: AddPostAPIRequest(request: request)) { (result: LMResponse<GetPostResponse>) in
            response?(result)
        }
    }
    
    public func getPost(_ request: GetPostRequest, _ response:  LMFeedClientResponse<GetPostResponse>?) {
        newManager.request(request: GetPostAPIRequest(request: request)) { (result: LMResponse<GetPostResponse>) in
            response?(result)
        }
    }
    
    public func getPostLikes(_ request: GetPostLikesRequest, _ response:  LMFeedClientResponse<GetPostLikeResponse>?) {
        newManager.request(request: GetPostLikeAPIRequest(request: request)) { (result: LMResponse<GetPostLikeResponse>) in
            response?(result)
        }
    }
    
    public func deletePost(_ request: DeletePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: DeletePostAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func deleteComment(_ request: DeleteCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: DeleteCommentAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func likePost(_ request: LikePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: LikePostAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func savePost(_ request: SavePostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: SavePostAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func addComment(_ request: AddCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        newManager.request(request: AddCommentAPIRequest(request: request)) { (result: LMResponse<GetCommentResponse>) in
            response?(result)
        }
    }
    
    public func replyComment(_ request: ReplyCommentRequest, _ response:  LMFeedClientResponse<ReplyCommentResponse>?) {
        newManager.request(request: ReplyCommentAPIRequest(request: request)) { (result: LMResponse<ReplyCommentResponse>) in
            response?(result)
        }
    }
    
    public func getComment(_ request: GetCommentRequest, _ response:  LMFeedClientResponse<GetCommentResponse>?) {
        newManager.request(request: GetCommentAPIRequest(request: request)) { (result: LMResponse<GetCommentResponse>) in
            response?(result)
        }
    }
    
    public func getCommentLikes(_ request: GetCommentLikesRequest, _ response:  LMFeedClientResponse<GetCommentsLikeResponse>?) {
        newManager.request(request: GetCommentLikesAPIRequest(request: request)) { (result: LMResponse<GetCommentsLikeResponse>) in
            response?(result)
        }
    }
    
    public func likeComment(_ request: LikeCommentRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: LikeCommentAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func getMemberState(_ response:  LMFeedClientResponse<GetMemberStateResponse>?) {
        newManager.request(request: GetMemberAPIRequest()) { (result: LMResponse<GetMemberStateResponse>) in
            response?(result)
        }
    }

    public func report(_ request: ReportRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: ReportAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func decodeUrl(_ request: DecodeUrlRequest, _ response: LMFeedClientResponse<DecodeUrlResponse>?) {
        newManager.request(request: DecodeUrlAPIRequest(request: request)) { (result: LMResponse<DecodeUrlResponse>) in
            response?(result)
        }
    }
    
    public func getReportTags(_ request: GetReportTagRequest, _ response:  LMFeedClientResponse<GetReportTagResponse>?) {
        newManager.request(request: GetReportTagAPIRequest(request: request)) { (result: LMResponse<GetReportTagResponse>) in
            response?(result)
        }
    }
    
    public func getTaggingList(_ request: GetTaggingListRequest, _ response:  LMFeedClientResponse<GetTaggingListResponse>?) {
        newManager.request(request: GetTaggingListAPIRequest(request: request)) { (result: LMResponse<GetTaggingListResponse>) in
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
            if result.success {
                /// Clearing Tokens if logout is successful
                FeedTokenManager.shared.clearToken()
            }
            
            response?(result)
        }
    }
    
    public func pinPost(_ request: PinPostRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: PinPostAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func editPost(_ request: EditPostRequest, _ response:  LMFeedClientResponse<EditPostResponse>?) {
        newManager.request(request: EditPostAPIRequest(request: request)) { (result: LMResponse<EditPostResponse>) in
            response?(result)
        }
    }
    
    public func editComment(_ request: EditCommentRequest, _ response:  LMFeedClientResponse<EditCommentResponse>?) {
        newManager.request(request: EditCommentAPIRequest(request: request)) { (result: LMResponse<EditCommentResponse>) in
            response?(result)
        }
    }
    
    public func markReadNotification(_ request: MarkReadNotificationRequest, _ response:  LMFeedClientResponse<NoData>?) {
        newManager.request(request: MarkReadNotificationAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }
    
    public func getUnreadNotificationCount(_ response:  LMFeedClientResponse<GetUnreadNotificationCountResponse>?) {
        newManager.request(request: GetUnreadNotificationCountAPIRequest()) { (result: LMResponse<GetUnreadNotificationCountResponse>) in
            response?(result)
        }
    }
    
    public func getNotificationFeed(_ request: GetNotificationFeedRequest, _ response:  LMFeedClientResponse<GetNotificationFeedResponse>?) {
        newManager.request(request: GetNotificationFeedAPIRequest(request: request)) { (result: LMResponse<GetNotificationFeedResponse>) in
            response?(result)
        }
    }
    
    public func getTopicFeed(_ request: TopicFeedRequest, _ response: LMFeedClientResponse<TopicFeedResponse>?) {
        newManager.request(request: TopicFeedAPIRequest(request: request)) { (result: LMResponse<TopicFeedResponse>) in
            response?(result)
        }
    }
    
    public func getCommunityConfiguration(_ request: GetCommunityConfigurationRequest, _ response: LMFeedClientResponse<GetCommunityConfigurationResponse>?) {
        newManager.request(request: GetCommunityConfigurationAPIRequest(request: request)) { (result: LMResponse<GetCommunityConfigurationResponse>) in
            response?(result)
        }
    }
    
    public func submitPollVoteRequest(_ request: SubmitPollVoteRequest, _ response: LMFeedClientResponse<NoData>?) {
        newManager.request(request: SubmitPollVoteAPIRequest(request: request)) { (result: LMResponse<NoData>) in
            response?(result)
        }
    }

    public func validateUser(_ request: ValidateUserRequest, response: LMFeedClientResponse<ValidateUserResponse>?) {
        FeedTokenManager.shared.updateToken(request.accessToken, request.refreshToken)
        
        LMFeedClientServiceRequest.validateUser(request, withModuleName: moduleName) { result in
            if result.success {
                if result.data?.appAccess == true {
                    UserDetails.userDetails = result.data?.user
                }
            }
            response?(result)
        }
    }
    
    public func addPollOption(_ request: AddPollOptionRequest, _ response: LMFeedClientResponse<AddPollOptionResponse>?) {
        newManager.request(request: AddPollOptionAPIRequest(request: request)) { (result: LMResponse<AddPollOptionResponse>) in
            response?(result)
        }
    }
    
    public func getPollVotes(_ request: GetPollVotesRequest, _ response: LMFeedClientResponse<GetPollVotesResponse>?) {
        newManager.request(request: GetPollVoteAPIRequest(request: request)) { (result: LMResponse<GetPollVotesResponse>) in
            response?(result)
        }
    }
    
    public func searchPosts(_ request: SearchPostsRequest, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        newManager.request(request: SearchPostAPIRequest(request: request)) { (result: LMResponse<GetFeedResponse>) in
            response?(result)
        }
    }
    
    func refreshAccessToken(_ response: LMFeedClientResponse<InitiateUserResponse>?) {
        guard let refreshToken = LMFeedTokenManager.refreshToken else {
            response?(.failureResponse("Unable To Fetch Refresh Token"))
            return
        }
        
        let networkPath = ServiceAPIRequest.NetworkPath.refreshServiceToken
        guard let url:URL = URL(string: ServiceAPI.authBaseURL + networkPath.apiURL) else { return }
        
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpSdkHeaders(headerKey: "Authorization", value: refreshToken),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<InitiateUserResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
}
