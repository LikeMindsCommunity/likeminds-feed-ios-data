//
//  EditCommentRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class EditCommentRequest: Encodable {
    var text: String?
    var postId: String?
    var commentId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> EditCommentRequest {
        return EditCommentRequest()
    }
    
    public func build() -> EditCommentRequest {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
    }
    
    public func text(_ text: String) -> EditCommentRequest {
        self.text = text
        return self
    }
    
    public func postId(_ postId: String) -> EditCommentRequest {
        self.postId = postId
        return self
    }
    
    public func commentId(_ commentId: String) -> EditCommentRequest {
        self.commentId = commentId
        return self
    }
}
