//
//  LMChatClient.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

/// Initiate LikeMinds extras data model for passing the initial value for sdk initialization
public class LMChatClient {
    
    private var apiKey: String // Api key of sdk
    private var domain: String? // Client domain url
    private var deviceUUID: String? // UUID of device
    weak var likemindsCallback: LikeMindsCallback? // LikeMinds callback
    
    /// Initiate method with api key param
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// Set the domain url
    public func domainUrl(_ domain: String) -> LMChatClient {
        self.domain = domain
        return self
    }
    
    /// Set the UUID of device
    public func deviceUUID(_ deviceUUID: String) -> LMChatClient {
        self.deviceUUID = deviceUUID
        return self
    }
    
    /// Set the callback
    public func callback(_ callback: LikeMindsCallback) -> LMChatClient {
        self.likemindsCallback = callback
        return self
    }
    
    /// get the api key
    func getApiKey() -> String { return self.apiKey }
    /// get the domain url
    func getDomainUrl() -> String? { return self.domain }
    /// get the domain url
    func getDeviceId() -> String? { return self.deviceUUID }
}
