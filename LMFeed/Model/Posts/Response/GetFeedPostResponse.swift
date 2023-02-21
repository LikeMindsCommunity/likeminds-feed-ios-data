//
//  GetFeedPostResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public struct GetFeedPostResponse: Decodable {
    public let post: [Post]?
}
