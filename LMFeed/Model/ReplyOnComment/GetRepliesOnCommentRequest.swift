//
//  GetRepliesOnCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 28/02/23.
//

import Foundation

public class GetRepliesOnCommentRequest: Encodable {
    var postId: String
    var commentId: String
    
    /// Initiate method with postid and text
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
    
}
