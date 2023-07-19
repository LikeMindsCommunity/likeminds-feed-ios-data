//
//  SavePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 03/04/23.
//

import Foundation

public class SavePostRequest: Encodable {
    var postId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> SavePostRequest {
        return SavePostRequest()
    }
    
    public func build() -> SavePostRequest {
        return self
    }
    
    public func postId(_ postId: String) -> SavePostRequest {
        self.postId = postId
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
