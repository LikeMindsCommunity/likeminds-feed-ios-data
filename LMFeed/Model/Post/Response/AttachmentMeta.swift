//
//  AttachmentMeta.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - AttachmentMeta
public class AttachmentMeta: Codable {
    public var attachmentUrl: String?
    public var format: String?
    public var pageCount, duration, size: Int? // size in bytes, duration in seconds
    public var ogTags: OGTags?
    
    public init() {
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentUrl = try container.decodeIfPresent(String.self, forKey: .attachmentUrl)
        self.format = try container.decodeIfPresent(String.self, forKey: .format)
        self.size = try container.decodeIfPresent(Int.self, forKey: .size)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
        self.ogTags = try container.decodeIfPresent(OGTags.self, forKey: .ogTags)
    }
    
    enum CodingKeys: String, CodingKey {
        case attachmentUrl = "url"
        case format
        case size, duration
        case pageCount = "page_count"
        case ogTags = "og_tags"
    }
    
    public func attachmentUrl(_ attachmentUrl: String) -> AttachmentMeta {
        self.attachmentUrl = attachmentUrl
        return self
    }
    
    public func format(_ format: String) -> AttachmentMeta {
        self.format = format
        return self
    }
    
    public func duration(_ duration: Int) -> AttachmentMeta {
        self.duration = duration
        return self
    }
    
    public func size(_ size: Int) -> AttachmentMeta {
        self.size = size
        return self
    }
    
    public func ogTags(_ ogTags: OGTags) -> AttachmentMeta {
        self.ogTags = ogTags
        return self
    }
    
    public func attachmentMetaData() -> AttachmentMeta {
        do {
            guard let url = URL(string: attachmentUrl ?? "") else {
                return self
            }
            let attachmentData = try Data(contentsOf: url)
            self.size = attachmentData.count/1000
        } catch let error {
            print(error)
        }
        return self
    }
}
