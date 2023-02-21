//
//  AddCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class AddCommentRequest: Encodable {
    var text: String
    var postId: String
    
    /// Initiate method with post text
    public init(postId: String, text: String) {
        self.text = text
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
    }
    
}
