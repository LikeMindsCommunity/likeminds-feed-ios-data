//
//  ValidateUserRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 30/05/24.
//

import Foundation

public final class ValidateUserRequest: Encodable {
    private(set) var accessToken: String
    private(set) var refreshToken: String
    
    private init(builder: Builder) {
        self.accessToken = builder.accessToken
        self.refreshToken = builder.refreshToken
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var accessToken: String = ""
        var refreshToken: String = ""
        
        public init() { }
        
        /// Sets the access token
        /// - Parameter accessToken: Access token for validation
        /// - Returns: Builder instance for method chaining
        public func accessToken(_ accessToken: String) -> Builder {
            self.accessToken = accessToken
            return self
        }
        
        /// Sets the refresh token
        /// - Parameter refreshToken: Refresh token for validation
        /// - Returns: Builder instance for method chaining
        public func refreshToken(_ refreshToken: String) -> Builder {
            self.refreshToken = refreshToken
            return self
        }
        
        /// Builds the ValidateUserRequest instance
        /// - Returns: Configured ValidateUserRequest
        /// - Throws: ValidateUserError if required fields are missing
        public func build() -> ValidateUserRequest {

            return ValidateUserRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        builder = builder.accessToken(self.accessToken)
            .refreshToken(self.refreshToken)
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

/// Custom errors for ValidateUser
public enum ValidateUserError: Error {
    case accessTokenNotProvided
    case refreshTokenNotProvided
}

extension ValidateUserError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .accessTokenNotProvided:
            return "Access token is required for validation"
        case .refreshTokenNotProvided:
            return "Refresh token is required for validation"
        }
    }
}
