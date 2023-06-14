//
//  PinPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class PinPostRequest: Encodable {
    var postId: String
    public init(postId: String) {
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
    }
}
