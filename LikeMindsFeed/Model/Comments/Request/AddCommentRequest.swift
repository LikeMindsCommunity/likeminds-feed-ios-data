//
//  AddCommentRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class AddCommentRequest: Encodable {
    public var text: String?
    public var postId: String?
    public var tempId: String?

    /// Initiate method
    private init() {}
    
    public static func builder() -> AddCommentRequest {
        return AddCommentRequest()
    }
    
    public func build() -> AddCommentRequest {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case text
        case tempId = "temp_id"
    }
    
    public func postId(_ postId: String) -> AddCommentRequest {
        self.postId = postId
        return self
    }
    
    public func text(_ text: String) -> AddCommentRequest {
        self.text = text
        return self
    }
    
    public func tempId(_ tempId: String) -> AddCommentRequest {
        self.tempId = tempId
        return self
    }
}
