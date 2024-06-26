//
//  ValidateUserRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 30/05/24.
//

import Foundation

public class ValidateUserRequest {
    var accessToken: String
    var refreshToken: String
    
    private init() { 
        accessToken = ""
        refreshToken = ""
    }
    
    public static func builder() -> ValidateUserRequest {
        return ValidateUserRequest()
    }
    
    public func build() -> ValidateUserRequest {
        return self
    }
    
    public func accessToken(_ accessToken: String) -> ValidateUserRequest {
        self.accessToken = accessToken
        return self
    }
    
    public func refreshToken(_ refreshToken: String) -> ValidateUserRequest {
        self.refreshToken = refreshToken
        return self
    }
}
