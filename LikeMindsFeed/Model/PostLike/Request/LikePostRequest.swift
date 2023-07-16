//
//  LikePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class LikePostRequest: Encodable {
    var postId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> LikePostRequest {
        return LikePostRequest()
    }
    
    public func build() -> LikePostRequest {
        return self
    }
    
    public func postId(_ postId: String) -> LikePostRequest {
        self.postId = postId
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
