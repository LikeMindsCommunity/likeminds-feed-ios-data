//
//  SavePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 03/04/23.
//

import Foundation

public struct SavePostRequest: Encodable {
    let postId: String
    
    public init(postId: String) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
