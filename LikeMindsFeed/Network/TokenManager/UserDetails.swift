//
//  UserDetails.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 20/06/24.
//

import Foundation

public struct UserDetails {
    @UserDefaultsBacked(key: "lmFeedUserDetails")
    public static var userDetails: User?
    
    @UserDefaultsBacked(key: "lmFeedAPIKey")
    static var apiKey: String?
}
