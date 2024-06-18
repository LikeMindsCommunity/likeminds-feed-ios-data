//
//  GetPollVotesResponse.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/06/24.
//

import Foundation

public struct GetPollVotesResponse: Decodable {
    public struct Vote: Decodable {
        let id: String?
        let users: [String]?

        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case users
        }
    }
    
    public let users: [String: User]?
    public let votes: [Vote]?
}
 
