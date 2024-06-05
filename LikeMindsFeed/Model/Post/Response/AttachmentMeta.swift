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
    public var format, name: String?
    public var pageCount, duration, size: Int? // size in bytes, duration in seconds
    public var ogTags: OGTags?
    public private(set) var coverImageUrl: String?
    public private(set) var title: String?
    public private(set) var body: String?
    public private(set) var entityID: String?
    public private(set) var thumbnailUrl: String?
    public private(set) var expiryTime: Double?
    public private(set) var pollOptions: [String]?
    public private(set) var multiSelectState: String = "exactly"
    public private(set) var pollType = "instant"
    public private(set) var multSelectNo: Int = 1
    public private(set) var isAnonymous: Bool = false
    public private(set) var allowAddOptions: Bool = false
    
    public init() { }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentUrl = try container.decodeIfPresent(String.self, forKey: .attachmentUrl)
        self.format = try container.decodeIfPresent(String.self, forKey: .format)
        self.size = try container.decodeIfPresent(Int.self, forKey: .size)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
        self.ogTags = try container.decodeIfPresent(OGTags.self, forKey: .ogTags)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.entityID = try container.decodeIfPresent(String.self, forKey: .entityID)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.coverImageUrl = try container.decodeIfPresent(String.self, forKey: .coverImageUrl)
        self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
        self.expiryTime = try container.decodeIfPresent(Double.self, forKey: .expiryTime)
        self.pollOptions = try container.decodeIfPresent([String].self, forKey: .pollOptions)
        self.multiSelectState = try container.decodeIfPresent(String.self, forKey: .multiSelectState) ?? "exactly"
        self.pollType = try container.decodeIfPresent(String.self, forKey: .pollType) ?? "instant"
        self.multSelectNo = try container.decodeIfPresent(Int.self, forKey: .multSelectNo) ?? 1
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous) ?? false
        self.allowAddOptions = try container.decodeIfPresent(Bool.self, forKey: .allowAddOptions) ?? false
    }
    
    enum CodingKeys: String, CodingKey {
        case attachmentUrl = "url"
        case format, name, title, body
        case size, duration
        case pageCount = "page_count"
        case ogTags = "og_tags"
        case coverImageUrl = "cover_image_url"
        case entityID = "entity_id"
        case thumbnailUrl = "thumbnail_url"
        case expiryTime = "expiry_time"
        case pollOptions = "options"
        case multiSelectState = "multiple_select_state"
        case pollType = "poll_type"
        case multSelectNo = "multiple_select_number"
        case isAnonymous = "is_anonymous"
        case allowAddOptions = "allow_add_options"
    }
    
    public func attachmentUrl(_ attachmentUrl: String) -> AttachmentMeta {
        self.attachmentUrl = attachmentUrl
        return self
    }
    
    public func pageCount(_ pageCount: Int) -> AttachmentMeta {
        self.pageCount = pageCount
        return self
    }
    
    public func format(_ format: String) -> AttachmentMeta {
        self.format = format
        return self
    }
    
    public func name(_ name: String) -> AttachmentMeta {
        self.name = name
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
    
    public func thumbnailUrl(_ thumbnailUrl: String?) -> AttachmentMeta {
        self.thumbnailUrl = thumbnailUrl
        return self
    }
    
    public func coverImageUrl(_ coverImageUrl: String) -> AttachmentMeta {
        self.coverImageUrl = coverImageUrl
        return self
    }
    
    public func title(_ title: String) -> AttachmentMeta {
        self.title = title
        return self
    }
    
    public func body(_ body: String) -> AttachmentMeta {
        self.body = body
        return self
    }
    
    public func entityID(_ entityID: String) -> AttachmentMeta {
        self.entityID = entityID
        return self
    }
    
    public func expiryTime(_ expiryTime: Double) -> AttachmentMeta {
        self.expiryTime = expiryTime
        return self
    }

    public func pollOptions(_ pollOptions: [String]) -> AttachmentMeta {
        self.pollOptions = pollOptions
        return self
    }

    public func multiSelectState(_ multiSelectState: String) -> AttachmentMeta {
        self.multiSelectState = multiSelectState
        return self
    }

    public func pollType(_ pollType: String) -> AttachmentMeta {
        self.pollType = pollType
        return self
    }

    public func multSelectNo(_ multSelectNo: Int) -> AttachmentMeta {
        self.multSelectNo = multSelectNo
        return self
    }

    public func isAnonymous(_ isAnonymous: Bool) -> AttachmentMeta {
        self.isAnonymous = isAnonymous
        return self
    }

    public func allowAddOptions(_ allowAddOptions: Bool) -> AttachmentMeta {
        self.allowAddOptions = allowAddOptions
        return self
    }
    
    public func attachmentMetaData() -> AttachmentMeta {
        do {
            guard let url = URL(string: attachmentUrl ?? "") else {
                return self
            }
            let attachmentData = try Data(contentsOf: url)
            self.size = attachmentData.count / 1000
        } catch let error {
            print(error)
        }
        return self
    }
}
