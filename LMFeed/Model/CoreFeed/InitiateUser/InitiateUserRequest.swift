//
//  InitiateUserRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

public class InitiateUserRequest: Encodable {
    var isGuest: Bool //true for guest user else false
    var userUniqueId: String? //unique id of user
    var userName: String? //user name
    var page: Int? //page number of home feed chat
    
    /// Initiate method with userUniqueId key param
    public init(_ isGuest: Bool, userUniqueId: String?) {
        self.userUniqueId = userUniqueId
        self.isGuest = isGuest
    }
    
    public func userName(_ userName: String) -> InitiateUserRequest {
        self.userName = userName
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case isGuest = "is_guest"
        case userUniqueId = "user_unique_id"
        case page = "page"
    }
}
