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
    var entityId: String
    var entityCreatorId: String?
    var entityType: ReportEntityType?
    var reason: String?
    
    /// Initiate method with entityId
    public init(_ entityId: String) {
        self.entityId = entityId
    }
    
    enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case entityCreatorId = "entity_creator_id"
        case entityType = "entity_type"
    }
    
    public func entityType(_ entityType: ReportEntityType) -> ReportRequest {
        self.entityType = entityType
        return self
    }
    
    public func entityCreatorId(_ entityCreatorId: String) -> ReportRequest {
        self.entityCreatorId = entityCreatorId
        return self
    }
    
    public func reason(_ reason: String) -> ReportRequest {
        self.reason = reason
        return self
    }
}
