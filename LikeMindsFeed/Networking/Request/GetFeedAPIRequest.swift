//
//  GetFeedAPIRequest.swift
//  Pods
//
//  Created by Devansh Mohata on 17/08/24.
//

// MARK: Universal Feed
struct GetFeedAPIRequest: ServiceProtocol {
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

    var body: [String : Any] = [:]
    
    let request: GetFeedRequest
    
    init(request: GetFeedRequest) {
        self.request = request
    }
}


// MARK: Add Post
struct AddPostAPIRequest: ServiceProtocol {
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


// MARK: Get Post
struct GetPostAPIRequest: ServiceProtocol {
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


// MARK: Get Post Likes
struct GetPostLikeAPIRequest: ServiceProtocol {
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


// MARK: Delete Post
struct DeletePostAPIRequest: ServiceProtocol {
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


// MARK: Delete Comment
struct DeleteCommentAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/post/\(request.postId!)/comment/\(request.commentId!)"
    }
    
    var httpMethod: HTTPMethod { .delete }
    
    var body: [String : Any] {
        if let reason = request.reason {
            return ["delete_reason": reason]
        }
        
        return [:]
    }
    
    let request: DeleteCommentRequest
    
    init(request: DeleteCommentRequest) {
        self.request = request
    }
}


// MARK: Like Post
struct LikePostAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/post/\(request.postId!)/like"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: LikePostRequest
    
    init(request: LikePostRequest) {
        self.request = request
    }
}


// MARK: Save Post
struct SavePostAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/post/\(request.postId!)/save"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: SavePostRequest
    
    init(request: SavePostRequest) {
        self.request = request
    }
}


// MARK: Add comment
struct AddCommentAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/post/\(request.postId!)/comment"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        ["temp_id": request.tempId!,
         "text": request.text!]
    }
    
    let request: AddCommentRequest
    
    init(request: AddCommentRequest) {
        self.request = request
    }
}


// MARK: Reply Comment
struct ReplyCommentAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/post/\(request.postId!)/comment/\(request.commentId!)/comment"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        ["temp_id": request.tempId!,
         "text": request.text!]
    }
    
    let request: ReplyCommentRequest
    
    init(request: ReplyCommentRequest) {
        self.request = request
    }
}
