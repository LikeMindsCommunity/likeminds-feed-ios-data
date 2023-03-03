//
//  GetPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 23/02/23.
//

import Foundation

public struct GetPostRequest: Encodable {
    let postId: String
    
    public init(postId: String) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
