//
//  RegisterDeviceRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public final class RegisterDeviceRequest: Encodable {
    private(set) var deviceId: String? //unique device id
    private(set) var token: String? // firebase device token
    private(set) var userId: String?
    
    private init(builder: Builder) {
        self.deviceId = builder.deviceId
        self.token = builder.token
        self.userId = builder.userId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var deviceId: String?
        var token: String?
        var userId: String?
        
        public init() { }
        
        /// Sets the user ID
        /// - Parameter userId: ID of the user
        /// - Returns: Builder instance for method chaining
        public func userId(_ userId: String) -> Builder {
            self.userId = userId
            return self
        }
        
        /// Sets the device token
        /// - Parameter token: Firebase device token
        /// - Returns: Builder instance for method chaining
        public func token(_ token: String) -> Builder {
            self.token = token
            return self
        }
        
        /// Sets the device ID
        /// - Parameter deviceId: Unique device identifier
        /// - Returns: Builder instance for method chaining
        public func deviceId(_ deviceId: String) -> Builder {
            self.deviceId = deviceId
            return self
        }
        
        /// Builds the RegisterDeviceRequest instance
        /// - Returns: Configured RegisterDeviceRequest
        public func build() -> RegisterDeviceRequest {
            return RegisterDeviceRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let deviceId = self.deviceId {
            builder = builder.deviceId(deviceId)
        }
        if let token = self.token {
            builder = builder.token(token)
        }
        if let userId = self.userId {
            builder = builder.userId(userId)
        }
        return builder
    }

    enum CodingKeys: String, CodingKey {
        case token
        case deviceId = "device_id"
        case userId = "member_id"
    }
}
