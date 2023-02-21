//
//  GetPostLikeResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - DataClass
struct GetPostLikeResponse: Codable {
    let likes: [Like]
    let totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case likes
        case totalCount = "total_count"
    }
}
