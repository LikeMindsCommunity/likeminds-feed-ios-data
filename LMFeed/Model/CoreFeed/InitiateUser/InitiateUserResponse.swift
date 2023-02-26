//
//  InitiateUserResponse.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

public struct InitiateUserResponse: Decodable {
    public let accessToken: String
    public let refreshToken: String
    public let hasAnswers: Bool?
    public let initialUser: InitialUser?
    public let appAccess: Bool?
    enum CodingKeys: String, CodingKey {
        case initialUser = "initial_user"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case appAccess = "app_access"
        case hasAnswers = "has_answers"
    }
}


public struct InitialUser: Decodable {
    public let user: User //user data
    public let community: Community //community data
}
