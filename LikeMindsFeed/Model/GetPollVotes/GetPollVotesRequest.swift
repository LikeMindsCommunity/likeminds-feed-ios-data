//
//  GetPollVotesRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/06/24.
//

import Foundation

public final class GetPollVotesRequest: Encodable {
    var pollID: String!
    var options: [String] = []
    var page: Int = 1
    var pageSize: Int = 10
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetPollVotesRequest {
        return GetPollVotesRequest()
    }
    
    public func build() -> GetPollVotesRequest {
        return self
    }
    
    public func pollID(_ pollID: String) -> GetPollVotesRequest {
        self.pollID = pollID
        return self
    }
    
    public func options(_ options: [String]) -> GetPollVotesRequest {
        self.options = options
        return self
    }
    
    public func page(_ page: Int) -> GetPollVotesRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetPollVotesRequest {
        self.pageSize = pageSize
        return self
    }
}
