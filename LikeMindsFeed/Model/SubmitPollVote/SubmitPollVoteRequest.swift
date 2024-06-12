//
//  SubmitPollVoteRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 12/06/24.
//

import Foundation

public class SubmitPollVoteRequest: Encodable {
    var pollID: String?
    var votes: [String] = []
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> SubmitPollVoteRequest {
        return SubmitPollVoteRequest()
    }
    
    public func build() -> SubmitPollVoteRequest {
        return self
    }
    
    public func pollID(_ pollID: String) -> SubmitPollVoteRequest {
        self.pollID = pollID
        return self
    }
    
    public func votes(_ votes: [String]) -> SubmitPollVoteRequest {
        self.votes = votes
        return self
    }
}
