//
//  EditCommentResponse.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 04/06/23.
//

import Foundation

// MARK: - EditCommentResponse
public struct EditCommentResponse: Codable {
    public let comment: Comment?
    public let users: [ String: User]?
}
