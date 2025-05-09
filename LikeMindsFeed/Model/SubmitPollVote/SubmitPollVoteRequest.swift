//
//  SubmitPollVoteRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 12/06/24.
//

import Foundation

public final class SubmitPollVoteRequest: Encodable {
    private(set) var pollID: String?
    private(set) var votes: [String]
    
    private init(builder: Builder) {
        self.pollID = builder.pollID
        self.votes = builder.votes
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var pollID: String?
        var votes: [String] = []
        
        public init() { }
        
        /// Sets the poll ID
        /// - Parameter pollID: ID of the poll
        /// - Returns: Builder instance for method chaining
        public func pollID(_ pollID: String) -> Builder {
            self.pollID = pollID
            return self
        }
        
        /// Sets the votes array
        /// - Parameter votes: Array of vote IDs
        /// - Returns: Builder instance for method chaining
        public func votes(_ votes: [String]) -> Builder {
            self.votes = votes
            return self
        }
        
        /// Builds the SubmitPollVoteRequest instance
        /// - Returns: Configured SubmitPollVoteRequest
        /// - Throws: SubmitPollVoteError if pollID is not provided
        public func build() throws -> SubmitPollVoteRequest {
            guard let _ = pollID else {
                throw SubmitPollVoteError.pollIDNotProvided
            }
            return SubmitPollVoteRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let pollID = self.pollID {
            builder = builder.pollID(pollID)
        }
        builder = builder.votes(self.votes)
        return builder
    }
    
    /// Coding keys for JSON encoding
    enum CodingKeys: String, CodingKey {
        case pollID = "poll_id"
        case votes
    }
}

/// Custom errors for SubmitPollVote
public enum SubmitPollVoteError: Error {
    case pollIDNotProvided
}

extension SubmitPollVoteError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .pollIDNotProvided:
            return "Poll ID is required for submitting votes"
        }
    }
}
