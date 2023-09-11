//
//  GetTaggingListResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 10/05/23.
//

import Foundation

import Foundation

// MARK: - GetTaggingListResponse
public struct GetTaggingListResponse: Decodable {
    public let members: [User]?
}
