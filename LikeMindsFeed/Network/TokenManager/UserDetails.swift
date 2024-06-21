//
//  UserDetails.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 20/06/24.
//

import Foundation

struct UserDetails {
    @UserDefaultsBacked(key: "lmFeedUserDetails")
    static var userDetails: User?
    
    @UserDefaultsBacked(key: "lmFeedAPIKey")
    static var apiKey: String?
}
