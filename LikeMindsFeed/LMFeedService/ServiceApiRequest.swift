//
//  ServiceApiRequest.swift
//  LikeMindsFeed
//
//  Created by Arpit Verma on 07/05/25.
//
import Alamofire
import Foundation

public struct ServiceAPI {
    static let requestTimeout = TimeInterval(30)
    static let authBaseURL = ServiceConfiguration.authBaseURL
    public static let bucketURL = ServiceConfiguration.bucketURL
    public static let awsPoolIdCognito = ServiceConfiguration.awsPoolIdCognito
    public static let secretAccessKey = ServiceConfiguration.secretAccessKey
    public static let accessKey = ServiceConfiguration.accessKey
}


struct ServiceAPIRequest {

    enum NetworkPath {
        //MARK:- SDK APIs
        case initiateChatClient(_ request: InitiateUserRequest)
        case validateUser
        case refreshServiceToken
        case pushToken(_ request: RegisterDeviceRequest)
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
        case searchPost(_ request: SearchPostsRequest)
        
        var apiURL: Endpoint {
            let paths = Paths.shared
            let keys = Constant.shared.keys
            
            switch self {
            case .getCommunityConfiguration(let request):
                let queryItems = [
                    URLQueryItem(name: keys.configurationTypes, value: request.configurationTypes?.joined(separator: ",") ?? "")
                ]
                return Endpoint(path: paths.communityConfigurations, queryItems: queryItems)
                
            case .initiateChatClient, .validateUser:
                return Endpoint(path: paths.sdkInitiate, queryItems: [])
                
            case .refreshServiceToken:
                return Endpoint(path: paths.userRefresh, queryItems: [])
                
            case .pushToken:
                return Endpoint(path: paths.userDevicePush, queryItems: [])
                
            case .onboardingChatService:
                return Endpoint(path: paths.sdkOnboarding, queryItems: [])
                
            case .universalFeed(let request):
                var queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)"),
                    URLQueryItem(name: keys.startFeedWithPostIds, value: "\(request.startFeedWithPostIds)")
                ]
                
                if !request.topics.isEmpty {
                    let topics = request.topics.joined(separator: ",")
                    queryItems.append(URLQueryItem(name: keys.topicIds, value: "[\(topics)]"))
                }
                
                return Endpoint(path: paths.universalFeed, queryItems: queryItems)
                
            case .getPost(let request):
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.getPostPath(postId: request.postId ?? ""), queryItems: queryItems)
                
            case .addPost:
                return Endpoint(path: paths.post, queryItems: [])
                
            case .getComment(let request):
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.getPostCommentPath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: queryItems)
                
            case .addComment(let request):
                return Endpoint(path: paths.getAddPostCommentPath(postId: request.postId ?? ""), queryItems: [])
                
            case .getPostLikes(let request):
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.getPostLikePath(postId: request.postId ?? ""), queryItems: queryItems)
                
            case .deletePost(let request):
                return Endpoint(path: paths.getPostPath(postId: request.postId ?? ""), queryItems: [])
                
            case .deleteComment(let request):
                return Endpoint(path: paths.getPostCommentPath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: [])
                
            case .likePost(let request):
                return Endpoint(path: paths.getPostLikePath(postId: request.postId ?? ""), queryItems: [])
                
            case .likeComment(let request):
                return Endpoint(path: paths.getCommentLikePath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: [])
                
            case .getCommentsLikes(let request):
            
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.getCommentLikePath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: queryItems)
                
            case .replyOnComment(let request):
                return Endpoint(path: paths.getPostCommentReplyPath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: [])
                
            case .getMemberState:
                return Endpoint(path: paths.communityMemberState, queryItems: [])
                
            case .getFeedGroup(let request):
                let queryItems = [
                    URLQueryItem(name: keys.feedroomId, value: request.feedroomId)
                ]
                return Endpoint(path: paths.feedGroup, queryItems: queryItems)
                
            case .report:
                return Endpoint(path: paths.communityReport, queryItems: [])
                
            case .urlDetails(let request):
                guard let link = request.link, let url = URL(string: link) else { return Endpoint(path: "", queryItems: []) }
                let queryItems = [
                    URLQueryItem(name: keys.url, value: url.absoluteString)
                ]
                return Endpoint(path: paths.helperUrl, queryItems: queryItems)
                
            case .savePost(let request):
                return Endpoint(path: paths.getPostSavePath(postId: request.postId ?? ""), queryItems: [])
                
            case .logout:
                return Endpoint(path: paths.userLogout, queryItems: [])
                
            case .getReportTags(let request):
                let queryItems = [
                    URLQueryItem(name: keys.type, value: "\(request.type ?? 3)")
                ]
                return Endpoint(path: paths.communityReportTag, queryItems: queryItems)
                
            case .pinPost(let request):
                return Endpoint(path: paths.getPostPinPath(postId: request.postId ?? ""), queryItems: [])
                
            case .editPost(let request):
                return Endpoint(path: paths.getPostPath(postId: request.postId ?? ""), queryItems: [])
                
            case .editComment(let request):
                return Endpoint(path: paths.getPostCommentPath(postId: request.postId ?? "", commentId: request.commentId ?? ""), queryItems: [])
                
            case .fetchTaggingList(let request):
                var queryItems = [
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)"),
                    URLQueryItem(name: keys.page, value: "\(request.page)")
                ]
                
                if !request.searchName.isEmpty {
                    queryItems.append(URLQueryItem(name: keys.searchName, value: request.searchName))
                }
                
                return Endpoint(path: paths.communityTag, queryItems: queryItems)
                
            case .getNotificationFeed(let request):
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.userActivity, queryItems: queryItems)
                
            case .markReadNotificationFeed(let request):
                return Endpoint(path: paths.getActivityMarkReadPath(activityId: request.activityId ?? ""), queryItems: [])
                
            case .getNotificationFeedUnreadCout:
                return Endpoint(path: paths.userActivityUnreadCount, queryItems: [])
                
            case .getAllMembers(let request):
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.communityMember, queryItems: queryItems)
                
            case .searchMembers(let request):
                let searchType = request.searchType ?? ""
                let search = request.search ?? ""
                let queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)"),
                    URLQueryItem(name: keys.searchType, value: searchType),
                    URLQueryItem(name: keys.search, value: search)
                ]
                return Endpoint(path: paths.communityMemberSearch, queryItems: queryItems)
                
            case .getTopicFeed(let request):
                var queryItems = [
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                
                if request.isEnabled {
                    queryItems.append(URLQueryItem(name: keys.isEnabled, value: "true"))
                }
                
                if let search = request.search {
                    queryItems.append(URLQueryItem(name: keys.search, value: search))
                    queryItems.append(URLQueryItem(name: keys.searchType, value: request.searchType))
                }
                
                return Endpoint(path: paths.topicFeed, queryItems: queryItems)
                
            case .submitVote(let request):
                return Endpoint(path: paths.getPollVotePath(pollId: request.pollID ?? ""), queryItems: [])
                
            case .addPollOption(let request):
                return Endpoint(path: paths.getPollPath(pollId: request.pollID ?? ""), queryItems: [])
                
            case .getPollVotes(let request):
                let queryItems = [
                    URLQueryItem(
                        name: keys.votes,
                        value: "[\(request.options.map { "\"\($0)\"" }.joined(separator: ","))]"
                    ),
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.getPollVotePath(pollId: request.pollID ?? ""), queryItems: queryItems)
                
            case .searchPost(let request):
                let queryItems = [
                    URLQueryItem(name: keys.search, value: request.search),
                    URLQueryItem(name: keys.searchType, value: request.searchType),
                    URLQueryItem(name: keys.page, value: "\(request.page)"),
                    URLQueryItem(name: keys.pageSize, value: "\(request.pageSize)")
                ]
                return Endpoint(path: paths.searchPost, queryItems: queryItems)
            }
        }

        var httpMethod: Alamofire.HTTPMethod {
            switch self {
            case .universalFeed,
                 .getCommunityConfiguration,
                 .getPostLikes,
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
                 .validateUser,
                 .searchPost:
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
                return ["text": request.pollText]
            default:
                return nil
            }
        }

        var encoding: Alamofire.ParameterEncoding {
            JSONEncoding.default
        }
    }
}
