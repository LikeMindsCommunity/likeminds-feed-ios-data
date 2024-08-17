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
