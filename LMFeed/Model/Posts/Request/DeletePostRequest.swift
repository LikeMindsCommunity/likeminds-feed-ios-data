//
//  DeletePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public struct DeletePostRequest: Encodable {
    public let postId: Int
    
    public init(postId: Int) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
