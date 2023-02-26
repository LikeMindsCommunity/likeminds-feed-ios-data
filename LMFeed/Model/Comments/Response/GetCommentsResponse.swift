//
//  GetCommentsResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - GetCommentsResponse
public struct GetCommentsResponse: Codable {
    public let comment: [Comment]?
    public let users: [CommentedUser]?
}
