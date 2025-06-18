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

public final class ReportRequest: Encodable {
    private(set) var tagId: Int?
    private(set) var entityId: String?
    private(set) var uuid: String?
    private(set) var entityType: ReportEntityType?
    private(set) var reason: String?
    
    private init(builder: Builder) {
        self.tagId = builder.tagId
        self.entityId = builder.entityId
        self.uuid = builder.uuid
        self.entityType = builder.entityType
        self.reason = builder.reason
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var tagId: Int?
        var entityId: String?
        var uuid: String?
        var entityType: ReportEntityType?
        var reason: String?
        
        public init() { }
        
        /// Sets the tag ID
        /// - Parameter tagId: ID of the report tag
        /// - Returns: Builder instance for method chaining
        public func tagId(_ tagId: Int) -> Builder {
            self.tagId = tagId
            return self
        }
        
        /// Sets the entity ID
        /// - Parameter entityId: ID of the entity being reported
        /// - Returns: Builder instance for method chaining
        public func entityId(_ entityId: String) -> Builder {
            self.entityId = entityId
            return self
        }
        
        /// Sets the UUID
        /// - Parameter uuid: Unique identifier for the report
        /// - Returns: Builder instance for method chaining
        public func uuid(_ uuid: String) -> Builder {
            self.uuid = uuid
            return self
        }
        
        /// Sets the entity type
        /// - Parameter entityType: Type of entity being reported
        /// - Returns: Builder instance for method chaining
        public func entityType(_ entityType: ReportEntityType) -> Builder {
            self.entityType = entityType
            return self
        }
        
        /// Sets the reason
        /// - Parameter reason: Reason for the report
        /// - Returns: Builder instance for method chaining
        public func reason(_ reason: String) -> Builder {
            self.reason = reason
            return self
        }
        
        /// Builds the ReportRequest instance
        /// - Returns: Configured ReportRequest
        public func build() -> ReportRequest {
            return ReportRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let tagId = self.tagId {
            builder = builder.tagId(tagId)
        }
        if let entityId = self.entityId {
            builder = builder.entityId(entityId)
        }
        if let uuid = self.uuid {
            builder = builder.uuid(uuid)
        }
        if let entityType = self.entityType {
            builder = builder.entityType(entityType)
        }
        if let reason = self.reason {
            builder = builder.reason(reason)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case uuid = "uuid"
        case entityType = "entity_type"
        case tagId = "tag_id"
        case reason
    }
}
