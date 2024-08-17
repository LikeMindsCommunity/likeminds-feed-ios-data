//
//  TokenManager.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/08/24.
//

import Foundation

public final class MyFeedTokenManager {
    public private(set) static var shared = MyFeedTokenManager()
    
    private(set) var accessToken: String?
    private(set) var refreshToken: String?
    
    private var refreshTokenCompletions: [(Result<String, Error>) -> Void] = []
    
    private var isRefreshingToken = false
    private var isRefreshingAccessToken = false
    
    private init() {}
    
    func onRefreshTokenExpired() {
        guard !isRefreshingToken else { return }
        
        isRefreshingToken = true
        clearToken()
        
        LMFeedClient.tokenManager?.onRefreshTokenExpired { [weak self] result in
            guard let self = self else { return }
            
            defer {
                self.isRefreshingAccessToken = false
                self.isRefreshingToken = false
            }
            
            if let result {
                self.updateToken(accessToken: result.accessToken, refreshToken: result.refreshToken)
                self.notifyCompletions(with: .success(result.accessToken))
            } else {
                self.notifyCompletions(with: .failure(LMFeedNetworkError.invalidTokens))
            }
            
            self.refreshTokenCompletions.removeAll()
        }
    }
    
    func refreshAccessToken(_ completion: @escaping (Result<String, Error>) -> Void) {
        refreshTokenCompletions.append(completion)
        
        guard !isRefreshingAccessToken else { return }
        
        isRefreshingAccessToken = true
        
        LMFeedClient.shared.refreshAccessToken { [weak self] result in
            guard let self = self else { return }
            
            defer { self.isRefreshingAccessToken = false }
            
            if result.success,
               let newAccessToken = result.data?.accessToken,
               let newRefreshToken = result.data?.refreshToken {
                self.updateToken(accessToken: newAccessToken, refreshToken: newRefreshToken)
                self.notifyCompletions(with: .success(newAccessToken))
                LMFeedClient.tokenManager?.onAccessTokenExpiredAndRefreshed(accessToken: newAccessToken, refreshToken: newRefreshToken)
            } else {
                self.notifyCompletions(with: .failure(LMFeedNetworkError.invalidTokens))
            }
            
            self.refreshTokenCompletions.removeAll()
        }
    }
    
    private func notifyCompletions(with result: Result<String, Error>) {
        refreshTokenCompletions.forEach { $0(result) }
    }
    
    func updateToken(accessToken: String?, refreshToken: String?) {
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
