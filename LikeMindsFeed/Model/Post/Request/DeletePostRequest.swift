//
//  DeletePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class DeletePostRequest: Encodable {
    var postId: String?
    var reason: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> DeletePostRequest {
        return DeletePostRequest()
    }
    
    public func build() -> DeletePostRequest {
        return self
    }
    
    public func postId(_ postId: String) -> DeletePostRequest {
        self.postId = postId
        return self
    }
    
    public func deleteReason(_ reason: String?) -> DeletePostRequest {
        self.reason = reason
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case reason = "delete_reason"
    }
}
