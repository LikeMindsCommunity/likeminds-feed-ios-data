//
//  AttachmentMeta.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - AttachmentMeta
public struct AttachmentMeta: Codable {
    public let url: String?
    public let format, duration, size: String?
    public let pageCount: Int?
    public let ogTags: OGTags?
    
    enum CodingKeys: String, CodingKey {
        case url
        case format
        case size, duration
        case pageCount = "page_count"
        case ogTags = "og_tags"
    }
}
