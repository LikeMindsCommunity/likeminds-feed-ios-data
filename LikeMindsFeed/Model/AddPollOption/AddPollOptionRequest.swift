//
//  AddPollOptionRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 12/06/24.
//

import Foundation

public final class AddPollOptionRequest: Encodable {
    var pollID: String!
    var pollText: String!
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> AddPollOptionRequest {
        return AddPollOptionRequest()
    }
    
    public func build() -> AddPollOptionRequest {
        return self
    }
    
    public func pollID(_ pollID: String) -> AddPollOptionRequest {
        self.pollID = pollID
        return self
    }
    
    public func pollText(_ pollText: String) -> AddPollOptionRequest {
        self.pollText = pollText
        return self
    }
}
