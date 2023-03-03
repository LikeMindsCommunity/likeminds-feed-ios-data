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
    var entityCreatorId: String
    var entityType: ReportEntityType
    
    /// Initiate method with postid and text
    public init(_ entityId: String, _ entityCreatorId: String, _ entityType: ReportEntityType) {
        self.entityId = entityId
        self.entityCreatorId = entityCreatorId
        self.entityType = entityType
    }
    
    enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case entityCreatorId = "entity_creator_id"
        case entityType = "entity_type"
    }
    
}
