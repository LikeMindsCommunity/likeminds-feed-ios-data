//
//  ReportRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 01/03/23.
//

import Foundation

public enum ReportEntityType: Int, Encodable {
    case post = 5
    case comment = 6
    case reply = 7
}

public class ReportRequest: Encodable {
    var tagId: Int?
    var entityId: String
    var uuid: String?
    var entityType: ReportEntityType?
    var reason: String?
    
    /// Initiate method with entityId
    public init(_ entityId: String) {
        self.entityId = entityId
    }
    
    enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case uuid = "uuid"
        case entityType = "entity_type"
        case tagId = "tag_id"
        case reason
    }
    
    public func entityType(_ entityType: ReportEntityType) -> ReportRequest {
        self.entityType = entityType
        return self
    }
    
    public func tagId(_ tagId: Int) -> ReportRequest {
        self.tagId = tagId
        return self
    }
    
    public func uuid(_ uuid: String) -> ReportRequest {
        self.uuid = uuid
        return self
    }
    
    public func reason(_ reason: String) -> ReportRequest {
        self.reason = reason
        return self
    }
}
