//
//  ServiceConfiguration.swift
//  CollabMates
//
//  Created by Likemind on 14/04/21.
//  Copyright © 2021 CollabMates. All rights reserved.
//

import Foundation
import Alamofire

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
    func appending(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems?.filter({$0.name != queryItem}) ??  []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}

struct ServiceAPI {
    static let requestTimeout = TimeInterval(30)
    static let baseURL = ServiceConfiguration.baseURL
    static let authBaseURL = ServiceConfiguration.authBaseURL
    static let subscriptionURL = ServiceConfiguration.subscriptionURL
    static let renewalURL = ServiceConfiguration.renewalURL
    static let bucketURL = ServiceConfiguration.bucketURL
    static let awsPoolIdCognito = ServiceConfiguration.awsPoolIdCognito
    static let secretAccessKey = ServiceConfiguration.secretAccessKey
    static let accessKey = ServiceConfiguration.accessKey
}

struct ServiceConfigurationURLs {
    struct Production {
        static let baseURL = "https://www.likeminds.community/"
        static let authBaseUrl = "https://auth.likeminds.community/"
        static let subscriptionURL = "https://subscription.likeminds.community/"
        static let renewalURL = "https://web.likeminds.community/"
        static let bucketURL = "prod-likeminds-media"
        static let awsPoolIdCognito = "d73bc2ed-bede-42c8-bab7-0abe0a001325"
        static let secretAccessKey = "hnhMpeHVw7N3YjDmuYJ+mNL+wf6umv+oHaz9fgfa"
        static let accessKey = "AKIA3HMTDICCWBSGV67Z"
    }
    struct DevTest {
        static let baseURL =  "https://beta.likeminds.community/"
        static let authBaseUrl = "https://betaauth.likeminds.community/"
        static let subscriptionURL =  "https://betasubscription.likeminds.community/"
        static let renewalURL = "https://betaweb.likeminds.community/"
        static let bucketURL = "beta-likeminds-media"
        static let awsPoolIdCognito = "181963ba-f2db-450b-8199-964a941b38c2"
        static let secretAccessKey = "9gKyjFCwxCDVT9XhyMWuH4GBqu/UI7pAQJFk6gun"
        static let accessKey = "AKIA3HMTDICCYBBYGI6J"
    }
    static let timeOutInterval:TimeInterval = 60
}


struct ServiceAPIRequest {

    enum NetworkPath {
        //MARK:- SDK APIs
        case initiateChatClient(_ request: InitiateUserRequest)
        case refreshServiceToken(rtm: String)
        case pushToken(_ request: RegisterDeviceRequest)
        case getBranding(_ request: BrandingRequest)
        case onboardingChatService
        case universalFeed(_ request: GetFeedRequest)
        case addPost(_ request: AddPostRequest)
        case addComment(_ request: AddCommentRequest)
        case likePost(_ request: LikePostRequest)
        case likeComment(_ request: LikeCommentRequest)
        case replyOnComment(_ request: ReplyOnCommentRequest)
        case getPost(_ request: GetPostRequest)
        case getPostLikes(_ request: GetPostLikesRequest)
        case getCommentsLikes(_ request: GetCommentLikesRequest)
        case getComments(_ request: GetCommentRequest)
        case getCommentsReplies(_ request: ReplyOnCommentRequest)
        case getFeedNotifications(_ resquest: GetFeedNotificationRequest)
        case deletePost(_ request: DeletePostRequest)
        case getMemberState(_ request: GetMemberStateRequest)
        case getFeedGroup(_ request: GetFeedGroupRequest)
        case logout(_ refreshToken: String)
        
        var apiURL: String {
            switch self {
            case .initiateChatClient:
                return "sdk/initiate"
            case .refreshServiceToken:
                return "user/refresh"
            case .pushToken(let request):
                return "api/push?device_id=\(request.deviceId)&member_id=\(request.userId ?? "")&token=\(request.token)"
            case .getBranding(let request):
                return ""
            case .onboardingChatService:
                return "sdk/onboarding"
            case .universalFeed(let request):
                return "feed/universal?page=\(request.page)&page_size=\(request.pageSize ?? 10)"
            case .getPost(let request):
                return "feed/post/\(request.postId)"
            case .addPost:
                return "feed/post"
            case .getComments(let request):
                return "feed/post/\(request.postId)/comment"
            case .addComment(let request):
                return "feed/post/\(request.postId)/comment"
            case .getPostLikes(let request):
                return "feed/post/\(request.postId)/like?page=\(request.page)&page_size=\(request.pageSize)"
            case .deletePost(let request):
                return "feed/post/\(request.postId)"
            case .likePost(let request):
                return "feed/post/\(request.postId)/like"
            case .likeComment(let request):
                return "feed/post/\(request.postId)/comment/\(request.commentId)/like"
            case  .getCommentsLikes(let request):
                return "feed/post/\(request.postId)/comment/\(request.commentId)/like"
            case .replyOnComment(let request):
                return "feed/post/\(request.postId)/comment/\(request.commentId)/comment"
            case .getCommentsReplies(let request):
                return "feed/post/\(request.postId)/comment/\(request.commentId)"
            case .getFeedNotifications(let request):
                return "feed/notification?page=\(request.page)&page_size=\(request.pageSize)"
            case .getMemberState(let request):
                return "community/member/state?member_id=" + "\(request.memberId)" + "&community_id=" + "\(request.communityId)"
            case .getFeedGroup(let request):
                return "feed/group?feedroom_id=\(request.feedroomId)"
            case .logout:
                return "user/logout"
            }
        }

        var httpMethod: Alamofire.HTTPMethod {
            switch self {
            case .universalFeed,
                 .getPostLikes,
                 .getBranding,
                 .getPost,
                 .getComments,
                 .getCommentsLikes,
                 .getCommentsReplies,
                 .getFeedNotifications,
                 .getMemberState,
                 .getFeedGroup,
                 .onboardingChatService:
                return .get
            case .initiateChatClient,
                 .refreshServiceToken,
                 .pushToken,
                 .addPost,
                 .addComment,
                 .replyOnComment,
                 .logout:
                return .post
            case .likePost,
                 .likeComment:
                return .put
            case .deletePost:
                return .delete
            }
        }

        var requestTimeout: TimeInterval {
            switch self {
            default:
                return ServiceAPI.requestTimeout
            }
        }

        var parameters: Alamofire.Parameters? {
            switch self {
            case .initiateChatClient(let request):
                return request.requestParam()
            case .refreshServiceToken:
                return [:]
            case .addPost(let request):
                return request.requestParam()
            case .replyOnComment(let request):
                return request.requestParam()
            case .addComment(let request):
                return request.requestParam()
            case .logout(let refreshToken):
                return ["refresh_token":refreshToken]
            default:
                return nil
            }
        }

        var encoding: Alamofire.ParameterEncoding {
            switch self {
//            case .setMuteUnMuteStatus(_, _),
//                 .sendEditConversation(_, _, _),
//                 .chatRoomMarkRead(_),
//                 .deleteChatRoom(_),
//                 .transferOwnerShip(_,_,_),
//                 .updatePendingChatroom(_),
//                 .closeReport(_),
//                 .addReaction(_),
//                 .removeReaction(_),
//                 .renameChatRoom(_, _, _):
//                return URLEncoding.default
//            case .removeUserAsCommunityManager(let memberID, let communityID):
//                return BodyStringEncoding(body: "community_id=\(communityID)&user_id=\(memberID)")
//            case .skipJoinCommunity(let communityID):
//                return BodyStringEncoding(body: "community_id=\(communityID)")
//            case .exitCommunity(let communityID):
//                return BodyStringEncoding(body: "community_id=\(communityID)")
            default:
                return JSONEncoding.default
            }
        }
    }
}


struct ServiceConfiguration {

    static let baseURL:String = {
        var url = ServiceConfigurationURLs.Production.baseURL
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.baseURL
            break
        case .production:
            break
        }
        return url
    }()
    
    static let authBaseURL:String = {
        var url = ServiceConfigurationURLs.Production.authBaseUrl
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.authBaseUrl
            break
        case .production:
            break
        }
        return url
    }()

    static let renewalURL:String = {
        var url = ServiceConfigurationURLs.Production.renewalURL
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.renewalURL
            break
        case .production:
            break
        }
        return url
    }()

    static let subscriptionURL:String = {
        var url = ServiceConfigurationURLs.Production.subscriptionURL
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.subscriptionURL
            break
        case .production:
            break
        }
        return url
    }()

    static let bucketURL:String = {
        var url = ServiceConfigurationURLs.Production.bucketURL
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.bucketURL
            break
        case .production:
            break
        }
        return url
    }()

    static let secretAccessKey:String = {
        var secretAccessKey = ServiceConfigurationURLs.Production.secretAccessKey
        switch BuildManager.environment {
        case .devtest:
            secretAccessKey = ServiceConfigurationURLs.DevTest.secretAccessKey
            break
        case .production:
            break
        }
        return secretAccessKey
    }()

    static let accessKey:String = {
        var accessKey = ServiceConfigurationURLs.Production.accessKey
        switch BuildManager.environment {
        case .devtest:
            accessKey = ServiceConfigurationURLs.DevTest.accessKey
            break
        case .production:
            break
        }
        return accessKey
    }()
    
    static let awsPoolIdCognito: String = {
        var accessKey = ServiceConfigurationURLs.Production.awsPoolIdCognito
        switch BuildManager.environment {
        case .devtest:
            accessKey = ServiceConfigurationURLs.DevTest.awsPoolIdCognito
            break
        case .production:
            break
        }
        return accessKey
    }()


}
