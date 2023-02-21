//
//  Attachment.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - Attachment
public struct Attachment: Codable {
    public let attachmentType: Int?
    public let attachmentMeta: AttachmentMeta?
    
    enum CodingKeys: String, CodingKey {
        case attachmentType = "attachment_type"
        case attachmentMeta = "attachment_meta"
    }
}
