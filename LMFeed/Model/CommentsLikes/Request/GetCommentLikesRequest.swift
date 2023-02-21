//
//  GetCommentLikesRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetCommentLikesRequest: Encodable {
    var postId: String
    var commentId: String
    
    public init(postId: String, commentId: String) {
        self.postId = postId
        self.commentId = commentId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case commentId = "comment_id"
    }
}
