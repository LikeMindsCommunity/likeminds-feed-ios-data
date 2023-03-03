//
//  GetCommentsResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - GetCommentsResponse
public struct GetCommentResponse: Codable {
    public let comment: Comment?
    public let users: [ String: User]?
}
