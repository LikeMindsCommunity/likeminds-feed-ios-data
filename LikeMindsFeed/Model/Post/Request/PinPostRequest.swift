//
//  PinPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class PinPostRequest: Encodable {
    
    var postId: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> PinPostRequest {
        return PinPostRequest()
    }
    
    public func build() -> PinPostRequest {
        return self
    }
    
    public func postId(_ postId: String) -> PinPostRequest {
        self.postId = postId
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
