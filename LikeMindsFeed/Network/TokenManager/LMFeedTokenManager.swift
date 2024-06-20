//
//  LMFeedTokenManager.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 20/06/24.
//

import Foundation

struct LMFeedTokenManager {
    @UserDefaultsBacked(key: "lmFeedAccessToken")
    static var accessToken: String?
    
    @UserDefaultsBacked(key: "lmFeedRefreshToken")
    static var refreshToken: String?
}

public struct LMFeedTokenResponse: Decodable {
    public let accessToken: String
    public let refreshToken: String
}
