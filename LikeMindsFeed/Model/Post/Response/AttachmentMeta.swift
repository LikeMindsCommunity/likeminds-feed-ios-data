//
//  AttachmentMeta.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - AttachmentMeta
///
/// A class that defines metadata for attachments. This includes properties like dimensions, formats, URLs, and additional metadata.
public class AttachmentMeta: Codable {
    /// The URL of the attachment.
    public var attachmentUrl: String?

    /// The format of the attachment (e.g., "image/png", "video/mp4").
    public var format, name: String?

    /// The width of the attachment in pixels.
    public var width: Int?

    /// The height of the attachment in pixels.
    public var height: Int?

    /// The number of pages for documents or attachments with pages.
    public var pageCount: Int?

    /// The duration of the attachment in seconds (applicable to audio/video).
    public var duration: Int?

    /// The size of the attachment in bytes.
    public var size: Int?

    /// Open Graph tags associated with the attachment.
    public var ogTags: OGTags?

    /// A URL for the cover image associated with the attachment.
    public private(set) var coverImageUrl: String?

    /// The title of the attachment.
    public private(set) var title: String?

    /// The body or description of the attachment.
    public private(set) var body: String?

    /// The unique identifier for the attachment entity.
    public private(set) var entityID: String?

    /// A URL for the thumbnail image of the attachment.
    public private(set) var thumbnailUrl: String?

    /// The expiry time of the attachment, represented as a UNIX timestamp.
    public private(set) var expiryTime: Int?

    /// Options for poll attachments.
    public private(set) var pollOptions: [String]?

    /// The multi-select state for poll options. Default is "exactly".
    public private(set) var multiSelectState: String = "exactly"

    /// The type of poll. Default is "instant".
    public private(set) var pollType = "instant"

    /// The maximum number of selections allowed in a poll. Default is 1.
    public private(set) var multSelectNo: Int = 1

    /// Indicates whether the poll is anonymous. Default is `false`.
    public private(set) var isAnonymous: Bool = false

    /// Indicates whether additional options can be added to the poll. Default is `false`.
    public private(set) var allowAddOptions: Bool = false

    /// Additional metadata stored as key-value pairs.
    public var meta: [String: Any]?

    private init(builder: Builder) {
        self.attachmentUrl = builder.attachmentUrl
        self.format = builder.format
        self.name = builder.name
        self.width = builder.width
        self.height = builder.height
        self.pageCount = builder.pageCount
        self.duration = builder.duration
        self.size = builder.size
        self.ogTags = builder.ogTags
        self.coverImageUrl = builder.coverImageUrl
        self.title = builder.title
        self.body = builder.body
        self.entityID = builder.entityID
        self.thumbnailUrl = builder.thumbnailUrl
        self.expiryTime = builder.expiryTime
        self.pollOptions = builder.pollOptions
        self.multiSelectState = builder.multiSelectState
        self.pollType = builder.pollType
        self.multSelectNo = builder.multSelectNo
        self.isAnonymous = builder.isAnonymous
        self.allowAddOptions = builder.allowAddOptions
        self.meta = builder.meta
    }
    
    // MARK: - Builder-style methods for setting properties
    /// Builder pattern for creating an instance of `AttachmentMeta`.
    public class Builder {
        public var attachmentUrl: String?
        public var format, name: String?
        public var width, height, pageCount, duration, size: Int?
        public var ogTags: OGTags?
        public var coverImageUrl: String?
        public var title: String?
        public var body: String?
        public var entityID: String?
        public var thumbnailUrl: String?
        public var expiryTime: Int?
        public var pollOptions: [String]?
        public var multiSelectState: String = "exactly"
        public var pollType = "instant"
        public var multSelectNo: Int = 1
        public var isAnonymous: Bool = false
        public var allowAddOptions: Bool = false
        public var meta: [String: Any]?

        public init() {}

        public func attachmentUrl(_ attachmentUrl: String?) -> Builder {
            self.attachmentUrl = attachmentUrl
            return self
        }

        public func format(_ format: String?) -> Builder {
            self.format = format
            return self
        }

        public func name(_ name: String?) -> Builder {
            self.name = name
            return self
        }

        public func width(_ width: Int?) -> Builder {
            self.width = width
            return self
        }

        public func height(_ height: Int?) -> Builder {
            self.height = height
            return self
        }

        public func pageCount(_ pageCount: Int?) -> Builder {
            self.pageCount = pageCount
            return self
        }

        public func duration(_ duration: Int?) -> Builder {
            self.duration = duration
            return self
        }

        public func size(_ size: Int?) -> Builder {
            self.size = size
            return self
        }

        public func ogTags(_ ogTags: OGTags?) -> Builder {
            self.ogTags = ogTags
            return self
        }

        public func coverImageUrl(_ coverImageUrl: String?) -> Builder {
            self.coverImageUrl = coverImageUrl
            return self
        }

        public func title(_ title: String?) -> Builder {
            self.title = title
            return self
        }

        public func body(_ body: String?) -> Builder {
            self.body = body
            return self
        }

        public func entityID(_ entityID: String?) -> Builder {
            self.entityID = entityID
            return self
        }

        public func thumbnailUrl(_ thumbnailUrl: String?) -> Builder {
            self.thumbnailUrl = thumbnailUrl
            return self
        }

        public func expiryTime(_ expiryTime: Int?) -> Builder {
            self.expiryTime = expiryTime
            return self
        }

        public func pollOptions(_ pollOptions: [String]?) -> Builder {
            self.pollOptions = pollOptions
            return self
        }

        public func multiSelectState(_ multiSelectState: String) -> Builder {
            self.multiSelectState = multiSelectState
            return self
        }

        public func pollType(_ pollType: String) -> Builder {
            self.pollType = pollType
            return self
        }

        public func multSelectNo(_ multSelectNo: Int) -> Builder {
            self.multSelectNo = multSelectNo
            return self
        }

        public func isAnonymous(_ isAnonymous: Bool) -> Builder {
            self.isAnonymous = isAnonymous
            return self
        }

        public func allowAddOptions(_ allowAddOptions: Bool) -> Builder {
            self.allowAddOptions = allowAddOptions
            return self
        }

        public func meta(_ meta: [String: Any]?) -> Builder {
            self.meta = meta
            return self
        }

        public func build() -> AttachmentMeta {
            return AttachmentMeta(builder: self)
        }
    }

    // MARK: Decoder
    /// Decodes an instance of `AttachmentMeta` from the provided `Decoder`.
    /// - Parameter decoder: The decoder to read data from.
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentUrl = try container.decodeIfPresent(
            String.self, forKey: .attachmentUrl)
        self.format = try container.decodeIfPresent(
            String.self, forKey: .format)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.size = try container.decodeIfPresent(Int.self, forKey: .size)
        self.duration = try container.decodeIfPresent(
            Int.self, forKey: .duration)
        self.pageCount = try container.decodeIfPresent(
            Int.self, forKey: .pageCount)
        self.ogTags = try container.decodeIfPresent(
            OGTags.self, forKey: .ogTags)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.entityID = try container.decodeIfPresent(
            String.self, forKey: .entityID)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.coverImageUrl = try container.decodeIfPresent(
            String.self, forKey: .coverImageUrl)
        self.thumbnailUrl = try container.decodeIfPresent(
            String.self, forKey: .thumbnailUrl)
        self.expiryTime = try container.decodeIfPresent(
            Int.self, forKey: .expiryTime)
        self.pollOptions = try container.decodeIfPresent(
            [String].self, forKey: .pollOptions)
        self.multiSelectState =
            try container.decodeIfPresent(
                String.self, forKey: .multiSelectState) ?? "exactly"
        self.pollType =
            try container.decodeIfPresent(String.self, forKey: .pollType)
            ?? "instant"
        self.multSelectNo =
            try container.decodeIfPresent(Int.self, forKey: .multSelectNo) ?? 1
        self.isAnonymous =
            try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
            ?? false
        self.allowAddOptions =
            try container.decodeIfPresent(Bool.self, forKey: .allowAddOptions)
            ?? false

        do {
            let decodedlmMeta = try container.decodeIfPresent(
                [String: AnyDecodable].self, forKey: .meta)
            self.meta = decodedlmMeta?.mapValues { $0.value }
        } catch {
            print("Error decoding metadata: \(error)")
            self.meta = nil
        }
    }

    // MARK: Encoder
    /// Encodes the instance of `AttachmentMeta` into the provided `Encoder`.
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(attachmentUrl, forKey: .attachmentUrl)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(pageCount, forKey: .pageCount)
        try container.encodeIfPresent(ogTags, forKey: .ogTags)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(entityID, forKey: .entityID)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(body, forKey: .body)
        try container.encodeIfPresent(coverImageUrl, forKey: .coverImageUrl)
        try container.encodeIfPresent(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(expiryTime, forKey: .expiryTime)
        try container.encodeIfPresent(pollOptions, forKey: .pollOptions)
        try container.encode(multiSelectState, forKey: .multiSelectState)
        try container.encode(pollType, forKey: .pollType)
        try container.encode(multSelectNo, forKey: .multSelectNo)
        try container.encode(isAnonymous, forKey: .isAnonymous)
        try container.encode(allowAddOptions, forKey: .allowAddOptions)

        if let meta = meta {
            let encodableMeta = meta.mapValues { AnyEncodable($0) }
            try container.encode(encodableMeta, forKey: .meta)
        }
    }

    // MARK: CodingKeys
    /// Enumeration of coding keys used for encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case attachmentUrl = "url"
        case format, name, title, body, meta
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
        case allowAddOptions = "allow_add_option"
        case width = "width"
        case height = "height"
    }
}
