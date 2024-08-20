//
//  LMFeedClient.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 16/02/23.
//

import Foundation

public protocol LMFeedSDKCallback: AnyObject {
    func onAccessTokenExpiredAndRefreshed(accessToken: String, refreshToken: String)
    func onRefreshTokenExpired(_ completionHandler: (((accessToken: String, refreshToken: String)?) -> Void)?)
}

public class LMFeedClient {
    public private(set) static var shared = LMFeedClient()
    static weak private(set) var tokenManager: LMFeedSDKCallback?
    
    var newManager: some NetworkProtocol = NetworkLayer()
    
    private init() {}
    
    public func getTokens() -> LMResponse<LMFeedTokenResponse> {
        guard let accessToken = LMFeedTokenManager.accessToken,
              let refreshToken = LMFeedTokenManager.refreshToken,
              !accessToken.isEmpty,
              !refreshToken.isEmpty else { return .failureResponse("Tokens not found") }
        
        let tokens = LMFeedTokenResponse(accessToken: accessToken, refreshToken: refreshToken)
        
        return .init(success: true, data: tokens, errorMessage: nil)
    }
    
    public func setTokenManager(with tokenManager: LMFeedSDKCallback) {
        Self.tokenManager = tokenManager
    }
    
    public func getAPIKey() -> LMResponse<String> {
        guard let apiKey = UserDetails.apiKey,
              !apiKey.isEmpty else { return .failureResponse("API Key not found") }
        
        return .init(success: true, data: apiKey, errorMessage: nil)
    }
    
    public func getUserDetails() -> User? {
        UserDetails.userDetails
    }
}
