//
//  ValidateUserResponse.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 30/05/24.
//

import Foundation

public struct ValidateUserResponse: Decodable {
    public let user: User?
    public let community: Community?
    public let appAccess: Bool?
    
    enum CodingKeys: String, CodingKey {
        case appAccess = "app_access"
        case user,
             community
    }
}
