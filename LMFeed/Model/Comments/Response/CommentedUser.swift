//
//  CommentedUser.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation

// MARK: - CommentedUser
public struct CommentedUser: Codable {
    public let userId: String?
    public let user: User?
}
