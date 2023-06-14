//
//  EditCommentRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class EditCommentRequest: Encodable {
    var text: String?
    var postId: String
    var commentId: String
    
    /// Initiate method with postid and text
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
    }
    
    public func text(_ text: String) -> EditCommentRequest {
        self.text = text
        return self
    }
    
}
