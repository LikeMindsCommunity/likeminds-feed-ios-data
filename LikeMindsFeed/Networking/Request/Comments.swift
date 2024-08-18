//
//  Comments.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//


// MARK: get comments
struct GetCommentAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        return "feed/post/\(request.postId!)/comment/\(request.commentId!)"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetCommentRequest
    
    init(request: GetCommentRequest) {
        self.request = request
    }
}


// MARK: add comment
struct AddCommentAPIRequest: RequestableAPIEndpointConfiguration {
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


// MARK: edit comment
struct EditCommentAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)/comment/\(request.commentId!)"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    var body: [String : Any] {
        ["text": request.text!]
    }
    
    let request: EditCommentRequest
    
    init(request: EditCommentRequest) {
        self.request = request
    }
}


// MARK: reply comment
struct ReplyCommentAPIRequest: RequestableAPIEndpointConfiguration {
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


// MARK: like comment
struct LikeCommentAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/post/\(request.postId!)/comment/\(request.commentId!)/like"
    }
    
    var httpMethod: HTTPMethod { .put }
    
    let request: LikeCommentRequest
    
    init(request: LikeCommentRequest) {
        self.request = request
    }
}


// MARK: get comment likes
struct GetCommentLikesAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        return "feed/post/\(request.postId!)/comment/\(request.commentId!)/like"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetCommentLikesRequest
    
    init(request: GetCommentLikesRequest) {
        self.request = request
    }
}


// MARK: delete comment
struct DeleteCommentAPIRequest: RequestableAPIEndpointConfiguration {
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
