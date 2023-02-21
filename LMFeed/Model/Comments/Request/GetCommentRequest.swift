//
//  GetCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class GetCommentRequest: Encodable {
    var postId: String?
    
    public init(postId: String) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
