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

public struct ServiceAPI {
    static let requestTimeout = TimeInterval(30)
    static let authBaseURL = ServiceConfiguration.authBaseURL
    public static let bucketURL = ServiceConfiguration.bucketURL
    public static let awsPoolIdCognito = ServiceConfiguration.awsPoolIdCognito
    public static let secretAccessKey = ServiceConfiguration.secretAccessKey
    public static let accessKey = ServiceConfiguration.accessKey
}

struct ServiceConfigurationURLs {
    struct Production {
        static let authBaseUrl = "https://auth.likeminds.community/"
        static let bucketURL = "prod-likeminds-media"
        static let awsPoolIdCognito = "d73bc2ed-bede-42c8-bab7-0abe0a001325"
        static let secretAccessKey = "aG5oTXBlSFZ3N04zWWpEbXVZSittTkwrd2Y2dW12K29IYXo5ZmdmYQ=="
        static let accessKey = "QUtJQTNITVRESUNDV0JTR1Y2N1o="
    }
    struct DevTest {
        static let authBaseUrl = "https://betaauth.likeminds.community/"
        static let bucketURL = "beta-likeminds-media"
        static let awsPoolIdCognito = "181963ba-f2db-450b-8199-964a941b38c2"
        static let secretAccessKey = "OWdLeWpGQ3d4Q0RWVDlYaHlNV3VINEdCcXUvVUk3cEFRSkZrNmd1bg=="
        static let accessKey = "QUtJQTNITVRESUNDWUJCWUdJNko="
    }
    static let timeOutInterval:TimeInterval = 60
}


struct ServiceAPIRequest {

    enum NetworkPath {
        //MARK:- SDK APIs
        case initiateChatClient(_ request: InitiateUserRequest)
        case validateUser
        case refreshServiceToken
        case pushToken(_ request: RegisterDeviceRequest)
        case getBranding(_ request: BrandingRequest)
        case onboardingChatService
        case universalFeed(_ request: GetFeedRequest)
        case addPost(_ request: AddPostRequest)
        case addComment(_ request: AddCommentRequest)
        case likePost(_ request: LikePostRequest)
        case likeComment(_ request: LikeCommentRequest)
        case replyOnComment(_ request: ReplyCommentRequest)
        case report(_ reqeust: ReportRequest)
        case getPost(_ request: GetPostRequest)
        case getPostLikes(_ request: GetPostLikesRequest)
        case getCommentsLikes(_ request: GetCommentLikesRequest)
        case getComment(_ request: GetCommentRequest)
        case deletePost(_ request: DeletePostRequest)
        case deleteComment(_ request: DeleteCommentRequest)
        case getMemberState
        case getFeedGroup(_ request: GetFeedOfFeedRoomRequest)
        case savePost(_ request: SavePostRequest)
        case logout(_ request: LogoutRequest)
        case urlDetails(_ request: DecodeUrlRequest)
        case getReportTags(_ request: GetReportTagRequest)
        case fetchTaggingList(_ request: GetTaggingListRequest)
        case getNotificationFeed(_ request: GetNotificationFeedRequest)
        case markReadNotificationFeed(_ request: MarkReadNotificationRequest)
        case getNotificationFeedUnreadCout
        case pinPost(_ request: PinPostRequest)
        case editPost(_ request: EditPostRequest)
        case editComment(_ request: EditCommentRequest)
        case getAllMembers(_ request: GetAllMembersRequest)
        case searchMembers(_ request: SearchMembersRequest)
        case getTopicFeed(_ request: TopicFeedRequest)
        case getCommunityConfiguration(_ request: GetCommunityConfigurationRequest)
        case submitVote(_ request: SubmitPollVoteRequest)
        case addPollOption(_ request: AddPollOptionRequest)
        case getPollVotes(_ request: GetPollVotesRequest)
        
        var apiURL: String {
            switch self {
            case .getCommunityConfiguration(let request):
                return "community/configurations?configuration_types=\(request.configurationTypes ?? [])"
            case .initiateChatClient,
                    .validateUser:
                return "sdk/initiate"
            case .refreshServiceToken:
                return "user/refresh"
            case .pushToken:
                return "user/device/push"
            case .getBranding:
                return ""
            case .onboardingChatService:
                return "sdk/onboarding"
            case .universalFeed(let request):
                var url = "feed/universal?page=\(request.page)&page_size=\(request.pageSize)"
                if !request.topics.isEmpty {
                    let topics = request.topics.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                    let top = "&topic_ids=[\(topics)]"
                    url.append(top)
                }
                return url
            case .getPost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)?page=\(request.page)&page_size=\(request.pageSize)"
            case .addPost:
                return "feed/post"
            case .getComment(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)?page=\(request.page)&page_size=\(request.pageSize)"
            case .addComment(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)/comment"
            case .getPostLikes(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)/like?page=\(request.page)&page_size=\(request.pageSize)"
            case .deletePost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)"
            case .deleteComment(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)"
            case .likePost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)/like"
            case .likeComment(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)/like"
            case  .getCommentsLikes(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)/like?page=\(request.page)&page_size=\(request.pageSize)"
            case .replyOnComment(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)/comment"
            case .getMemberState:
                return "community/member/state"
            case .getFeedGroup(let request):
                return "feed/group?feedroom_id=\(request.feedroomId)"
            case .report:
                return "community/report"
            case .urlDetails(let request):
                guard let link = request.link,
                      let Url = URL(string: link) else {
                    return ""
                }
                return "helper/url?url=\(Url.absoluteString)"
            case .savePost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)/save"
            case .logout:
                return "user/logout"
            case .getReportTags(let request):
                return "community/report/tag?type=\(request.type ?? 3)"
            case .pinPost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)/pin"
            case .editPost(let request):
                guard let postId = request.postId else { return ""}
                return "feed/post/\(postId)"
            case .editComment(let request):
                guard let postId = request.postId, let commentId = request.commentId else { return ""}
                return "feed/post/\(postId)/comment/\(commentId)"
            case .fetchTaggingList(let request):
                let requestUrl = "community/tag?page_size=\(request.pageSize)&page=\(request.page)" + (request.searchName.isEmpty ? "" : "&search_name=\(request.searchName)")
                return requestUrl
            case .getNotificationFeed(let request):
                return "feed/user/activity?page=\(request.page)&page_size=\(request.pageSize)"
            case .markReadNotificationFeed(let request):
                guard let activityId = request.activityId else { return ""}
                return "feed/user/activity/\(activityId)/mark_read"
            case .getNotificationFeedUnreadCout:
                return "feed/user/activity/unread_count"
            case .getAllMembers(let request):
                return "community/member?page=\(request.page)&page_size=\(request.pageSize)"
            case .searchMembers(let request):
                let searchType = request.searchType ?? ""
                let search = request.search ?? ""
                return "community/member/search?page=\(request.page)&page_size=\(request.pageSize)&search_type=\(searchType)&search=\(search)"
            case .getTopicFeed(let request):
                var url = "feed/topic?page=\(request.page)&page_size=\(request.pageSize)"
                
                if request.isEnabled {
                    url.append("&is_enabled=true")
                }
                
                if let search = request.search {
                    url.append("&search=\(search)&search_type=\(request.searchType)")
                }
                
                return url
            case .submitVote(let request):
                guard let pollID = request.pollID else { return "" }
                return "poll/\(pollID)/vote"
            case .addPollOption(let request):
                guard let pollID = request.pollID,
                      request.pollText != nil else { return "" }
                return "poll/\(pollID)"
            case .getPollVotes(let request):
                guard let pollID = request.pollID else { return "" }
                return "poll/\(pollID)/vote?votes=\(request.options)&page=\(request.page)&page_size=\(request.pageSize)"
            }
        }

        var httpMethod: Alamofire.HTTPMethod {
            switch self {
            case .universalFeed,
                 .getCommunityConfiguration,
                 .getPostLikes,
                 .getBranding,
                 .getPost,
                 .getComment,
                 .getCommentsLikes,
                 .getMemberState,
                 .getFeedGroup,
                 .urlDetails,
                 .getReportTags,
                 .fetchTaggingList,
                 .getNotificationFeed,
                 .getNotificationFeedUnreadCout,
                 .getAllMembers,
                 .searchMembers,
                 .onboardingChatService,
                 .getTopicFeed,
                 .getPollVotes,
                 .validateUser:
                return .get
            case .initiateChatClient,
                 .refreshServiceToken,
                 .pushToken,
                 .addPost,
                 .addComment,
                 .replyOnComment,
                 .report,
                 .markReadNotificationFeed,
                 .logout:
                return .post
            case .likePost,
                 .savePost,
                 .pinPost,
                 .editPost,
                 .editComment,
                 .likeComment,
                 .submitVote,
                 .addPollOption:
                return .put
            case .deletePost,
                 .deleteComment:
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
            case .pushToken(let request):
                return ["token": request.token ?? ""]
            case .refreshServiceToken:
                return [:]
            case .addPost(let request):
                return request.requestParam()
            case .replyOnComment(let request):
                return request.requestParam()
            case .addComment(let request):
                return request.requestParam()
            case .report(let request):
                return request.requestParam()
            case .logout(let request):
                return request.requestParam()
            case .deletePost(let request):
                return request.requestParam()
            case .deleteComment(let request):
                return request.requestParam()
            case .editPost(let request):
                return request.requestParam()
            case .editComment(let request):
                return request.requestParam()
            case .submitVote(let request):
                return ["votes": request.votes]
            case .addPollOption(let request):
                guard let pollText = request.pollText else { return nil }
                return ["text": pollText]
            default:
                return nil
            }
        }

        var encoding: Alamofire.ParameterEncoding {
            JSONEncoding.default
        }
    }
}


struct ServiceConfiguration {
    static let authBaseURL: String = {
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

    static let bucketURL: String = {
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

    static let secretAccessKey: String = {
        var secretAccessKey = ServiceConfigurationURLs.Production.secretAccessKey.fromBase64() ?? ""
        switch BuildManager.environment {
        case .devtest:
            secretAccessKey = ServiceConfigurationURLs.DevTest.secretAccessKey.fromBase64() ?? ""
            break
        case .production:
            break
        }
        return secretAccessKey
    }()

    static let accessKey: String = {
        var accessKey = ServiceConfigurationURLs.Production.accessKey.fromBase64() ?? ""
        switch BuildManager.environment {
        case .devtest:
            accessKey = ServiceConfigurationURLs.DevTest.accessKey.fromBase64() ?? ""
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
