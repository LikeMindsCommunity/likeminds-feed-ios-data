//
//  ReplyCommentResponse.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 28/06/23.
//

import Foundation

public struct ReplyCommentResponse: Codable {
    public let comment: Comment?
    public let users: [ String: User]?
}
