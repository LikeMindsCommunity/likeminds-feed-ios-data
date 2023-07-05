//
//  ReplyOnCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

public class ReplyCommentRequest: Encodable {
    var text: String
    var postId: String
    var commentId: String
    
    /// Initiate method with postid and text
    public init(postId: String, text: String, commentId: String) {
        self.text = text
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case commentId = "comment_id"
    }
    
}
