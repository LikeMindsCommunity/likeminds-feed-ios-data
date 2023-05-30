//
//  InitiateUserRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

public class InitiateUserRequest: Encodable {
    var isGuest: Bool? //true for guest user else false
    var userUniqueId: String? //unique id of user
    var userName: String? //user name
    var apiKey: String
    var page: Int = 10 //page number of home feed chat
    
    /// Initiate method with userUniqueId key param
    public init(_ apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func isGuest(_ isGuest: Bool) -> InitiateUserRequest {
        self.isGuest = isGuest
        return self
    }
    
    public func userName(_ userName: String) -> InitiateUserRequest {
        self.userName = userName
        return self
    }
    
    public func userUniqueId(_ userUniqueId: String) -> InitiateUserRequest {
        self.userUniqueId = userUniqueId
        return self
    }
    
    public func page(_ page: Int) -> InitiateUserRequest {
        self.page = page
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case isGuest = "is_guest"
        case userUniqueId = "user_unique_id"
        case apiKey = "api_key"
        case page = "page"
    }
}
