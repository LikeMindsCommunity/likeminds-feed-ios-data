//
//  DeletePostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class DeletePostRequest: Encodable {
    public let postId: String
    public var reason: String?
    
    public init(postId: String) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case reason = "delete_reason"
    }
    
    public func deleteReason(_ reason: String) -> DeletePostRequest {
        self.reason = reason
        return self
    }
}
