//
//  Attachment.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public enum AttachmentType: Int, Encodable {
    case image = 1
    case video = 2
    case doc = 3
    case link = 4
    case widget = 5
    case poll = 6
    case article = 7
    case unknown = -1
}

// MARK: - Attachment
public class Attachment: Codable {
    public var attachmentType: AttachmentType?
    public var attachmentMeta: AttachmentMeta?
    
    enum CodingKeys: String, CodingKey {
        case attachmentType = "attachment_type"
        case attachmentMeta = "attachment_meta"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentType = AttachmentType(rawValue: try container.decodeIfPresent(Int.self, forKey: .attachmentType) ?? -1)
        self.attachmentMeta = try container.decodeIfPresent(AttachmentMeta.self, forKey: .attachmentMeta)
    }
    
    public init() { }
    
    public func attachmentMeta(_ attachmentMeta: AttachmentMeta) -> Attachment {
        self.attachmentMeta = attachmentMeta
        return self
    }
    
    public func attachmentType(_ attachmentType: AttachmentType) -> Attachment {
        self.attachmentType = attachmentType
        return self
    }
    
}
