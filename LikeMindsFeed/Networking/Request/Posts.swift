//
//  Posts.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//

// MARK: universal feed
struct GetFeedAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/universal"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        var params: [String: Any] = [
            "page": request.page,
            "page_size": request.pageSize
        ]
        
        if !request.topics.isEmpty {
            let topics = request.topics
                .joined(separator: ",")
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed
                ) ?? ""
            params["topic_ids"] = topics
        }
        
        return params
    }
    
    let request: GetFeedRequest
    
    init(request: GetFeedRequest) {
        self.request = request
    }
}


// MARK: get post
struct GetPostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetPostRequest
    
    init(request: GetPostRequest) {
        self.request = request
    }
}


// MARK: add post
struct AddPostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String { "feed/post" }
    
    var httpMethod: HTTPMethod { .post }
    
    var queryParams: [String : Any] = [:]
    
    var body: [String : Any] {
        request.toJSON()
    }
    
    let request: AddPostRequest
    
    init(request: AddPostRequest) {
        self.request = request
    }
}


// MARK: edit post
struct EditPostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    var body: [String : Any] {
        request.toJSON()
    }
    
    let request: EditPostRequest
    
    init(request: EditPostRequest) {
        self.request = request
    }
}


// MARK: delete post
struct DeletePostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)"
    }
    
    var httpMethod: HTTPMethod { .delete }
    
    var body: [String : Any] {
        if let reason = request.reason {
            return ["delete_reason": reason]
        }
        
        return [:]
    }
    
    let request: DeletePostRequest
    
    init(request: DeletePostRequest) {
        self.request = request
    }
}


// MARK: get post likes
struct GetPostLikeAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        return "feed/post/\(request.postId!)/like"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetPostLikesRequest
    
    init(request: GetPostLikesRequest) {
        self.request = request
    }
}

// MARK: like post
struct LikePostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)/like"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: LikePostRequest
    
    init(request: LikePostRequest) {
        self.request = request
    }
}


// MARK: save post
struct SavePostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)/save"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: SavePostRequest
    
    init(request: SavePostRequest) {
        self.request = request
    }
}


// MARK: pin post
struct PinPostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)/pin"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: PinPostRequest
    
    init(request: PinPostRequest) {
        self.request = request
    }
}


// MARK: search posts
struct SearchPostAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "search/post"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["search": request.search,
         "search_type": request.searchType,
         "page": request.page,
         "page_size": request.page]
    }
    
    let request: SearchPostsRequest
    
    init(request: SearchPostsRequest) {
        self.request = request
    }
}



// MARK: poll related queries

// MARK: submit poll vote
struct SubmitPollVoteAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "poll/\(request.pollID!)/vote"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    var body: [String : Any] {
        ["votes": request.votes]
    }
    
    let request: SubmitPollVoteRequest
    
    init(request: SubmitPollVoteRequest) {
        self.request = request
    }
}


// MARK: add poll option
struct AddPollOptionAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "poll/\(request.pollID!)"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    var body: [String : Any] {
        ["text": request.pollText!]
    }
    
    let request: AddPollOptionRequest
    
    init(request: AddPollOptionRequest) {
        self.request = request
    }
}


// MARK: get poll votes
struct GetPollVoteAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        return "poll/\(request.pollID!)/vote"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["votes": request.options,
         "page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetPollVotesRequest
    
    init(request: GetPollVotesRequest) {
        self.request = request
    }
}
