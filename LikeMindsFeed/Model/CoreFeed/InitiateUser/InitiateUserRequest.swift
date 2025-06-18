//
//  InitiateUserRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

public final class InitiateUserRequest: Encodable {
    private(set) var isGuest: Bool? //true for guest user else false
    private(set) var uuid: String? //unique id of user
    private(set) var userName: String? //user name
    private(set) var apiKey: String?
    
    private init(builder: Builder) {
        self.isGuest = builder.isGuest
        self.uuid = builder.uuid
        self.userName = builder.userName
        self.apiKey = builder.apiKey
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var isGuest: Bool?
        var uuid: String?
        var userName: String?
        var apiKey: String?
        
        public init() { }
        
        /// Sets the API key
        /// - Parameter apiKey: API key for authentication
        /// - Returns: Builder instance for method chaining
        public func apiKey(_ apiKey: String) -> Builder {
            self.apiKey = apiKey
            return self
        }
        
        /// Sets whether the user is a guest
        /// - Parameter isGuest: true for guest user, false otherwise
        /// - Returns: Builder instance for method chaining
        public func isGuest(_ isGuest: Bool) -> Builder {
            self.isGuest = isGuest
            return self
        }
        
        /// Sets the user name
        /// - Parameter userName: Name of the user
        /// - Returns: Builder instance for method chaining
        public func userName(_ userName: String?) -> Builder {
            self.userName = userName
            return self
        }
        
        /// Sets the unique identifier
        /// - Parameter uuid: Unique identifier for the user
        /// - Returns: Builder instance for method chaining
        public func uuid(_ uuid: String) -> Builder {
            self.uuid = uuid
            return self
        }
        
        /// Builds the InitiateUserRequest instance
        /// - Returns: Configured InitiateUserRequest
        public func build() -> InitiateUserRequest {
            return InitiateUserRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let isGuest = self.isGuest {
            builder = builder.isGuest(isGuest)
        }
        if let uuid = self.uuid {
            builder = builder.uuid(uuid)
        }
        if let userName = self.userName {
            builder = builder.userName(userName)
        }
        if let apiKey = self.apiKey {
            builder = builder.apiKey(apiKey)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case isGuest = "is_guest"
        case uuid
        case apiKey = "api_key"
    }
}
