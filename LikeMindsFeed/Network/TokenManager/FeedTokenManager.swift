//
//  FeedTokenManager.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

final public class FeedTokenManager {
    /// Singleton object property
    public private(set) static var shared = FeedTokenManager()
    
    private(set) var accessToken: String?
    private(set) var refreshToken: String?
    
    /// Refresh token completion block
    private var refreshTokenBlock: [((String?) -> Void)?] = []
    
    private var isRefreshingToken: Bool = false
    private var isRefreshAccessToken: Bool = false
    
    /// Restrict to create another object of this singleton class
    private init(){}
    
    /// Fetch New Pair of Tokens
    func onRefreshTokenExpired() {
        if isRefreshingToken { return }
        
        isRefreshingToken = true
        clearToken()
        
        LMFeedClient.tokenManager?.onRefreshTokenExpired { [weak self] tokens in
            guard let tokens else {
                self?.isRefreshAccessToken = false
                self?.isRefreshingToken = false
                self?.refreshTokenBlock.removeAll()
                return
            }
            
            self?.updateToken(tokens.accessToken, tokens.refreshToken)
            
            self?.refreshTokenBlock.forEach { com in
                com?(tokens.accessToken)
            }
            self?.refreshTokenBlock.removeAll()
            self?.isRefreshAccessToken = false
            self?.isRefreshingToken = false
        }
    }
    
    func refreshAccessToken(_ completion: @escaping (String?)->Void) {
        refreshTokenBlock.append(completion)
        
        if isRefreshAccessToken { return }
        
        isRefreshAccessToken = true
        
        LMFeedClient.shared.refreshAccessToken { [weak self] response in
            guard response.success,
                  let accessToken = response.data?.accessToken,
                  let refreshToken = response.data?.refreshToken else {
                self?.isRefreshAccessToken = false
                return
            }
            
            self?.updateToken(accessToken, refreshToken)
            
            self?.refreshTokenBlock.forEach { com in
                com?(accessToken)
            }
            self?.refreshTokenBlock.removeAll()
            
            LMFeedClient.tokenManager?.onAccessTokenExpiredAndRefreshed(accessToken: accessToken, refreshToken: refreshToken)
            self?.isRefreshAccessToken = false
        }
    }
    
    func updateToken(_ accessToken: String?, _ refreshToken: String?) {
        LMFeedTokenManager.refreshToken = refreshToken
        LMFeedTokenManager.accessToken = accessToken
        
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    func clearToken() {
        LMFeedTokenManager.refreshToken = nil
        LMFeedTokenManager.accessToken = nil
        
        accessToken = nil
        refreshToken = nil
    }
}
