//
//  FeedTokenManager.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation
import Alamofire

/**
 * A protocol to handle login requried action
 *
 */
public protocol LMCallback: AnyObject {
    /// This method is called when the user is not logged in or guest
    /// It is called when the user tries to perform an action that requires login
    /// The user should be redirected to your appropriate login screen
    func login()
}

/// Default implementation of delegate
public extension LMCallback {
    func login() {}
}

final public class FeedTokenManager {
    /// Singleton object property
    public private(set) static var shared = FeedTokenManager()
    
    /// Refresh token completion block
    private var refreshTokenBlock: [((String?) -> Void)?] = []
    
    private var isRefreshingToken: Bool = false
    private var isRefreshAccessToken: Bool = false
    
    /// Restrict to create another object of this singleton class
    private init(){}
    
    /// Fetch New Pair of Tokens
    func onRefreshTokenExpired() {
        if isRefreshingToken { return }
        
        isRefreshingToken.toggle()
        clearToken()
        
        LMFeedClient.tokenManager?.onRefreshTokenExpired { [weak self] tokens in
            guard let tokens else {
                self?.isRefreshingToken.toggle()
                self?.refreshTokenBlock.removeAll()
                return
            }
            
            self?.updateToken(tokens.accessToken, tokens.refreshToken)
            
            self?.refreshTokenBlock.forEach { com in
                com?(tokens.accessToken)
            }
            self?.refreshTokenBlock.removeAll()
            self?.isRefreshingToken.toggle()
        }
    }
    
    func refreshAccessToken(_ completion: @escaping (String?)->Void) {
        refreshTokenBlock.append(completion)
        
        if isRefreshAccessToken { return }
        
        isRefreshAccessToken.toggle()
        
        LMFeedClient.shared.refreshAccessToken { [weak self] response in
            
            
            guard response.success,
                  let accessToken = response.data?.accessToken,
                  let refreshToken = response.data?.refreshToken else {
                self?.isRefreshAccessToken.toggle()
                return
            }
            
            self?.updateToken(accessToken, refreshToken)
            
            self?.refreshTokenBlock.forEach { com in
                com?(accessToken)
            }
            self?.refreshTokenBlock.removeAll()
            
            LMFeedClient.tokenManager?.onAccessTokenExpiredAndRefreshed(accessToken: accessToken, refreshToken: refreshToken)
            self?.isRefreshAccessToken.toggle()
        }
    }
    
    func updateToken(_ accessToken: String?, _ refreshToken: String?) {
        LMFeedTokenManager.refreshToken = refreshToken
        LMFeedTokenManager.accessToken = accessToken
    }
    
    func clearToken() {
        LMFeedTokenManager.refreshToken = nil
        LMFeedTokenManager.accessToken = nil
    }
}


@propertyWrapper
struct UserDefaultsBacked<Value: Codable> {
    let key: String
    let userDefaults: UserDefaults

    init(key: String, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }

    var wrappedValue: Value? {
        get {
            guard let data = userDefaults.data(forKey: key) else {
                return nil
            }
            let decoder = JSONDecoder()
            return try? decoder.decode(Value.self, from: data)
        }
        set {
            let encoder = JSONEncoder()
            if let value = newValue, 
                let data = try? encoder.encode(value) {
                userDefaults.set(data, forKey: key)
            } else {
                userDefaults.removeObject(forKey: key)
            }
            
            userDefaults.synchronize()
        }
    }
}

struct LMFeedTokenManager {
    @UserDefaultsBacked(key: "lmFeedAccessToken")
    static var accessToken: String?
    
    @UserDefaultsBacked(key: "lmFeedRefreshToken")
    static var refreshToken: String?
}

struct UserDetails {
    @UserDefaultsBacked(key: "lmFeedUserDetails")
    static var userDetails: User?
    
    @UserDefaultsBacked(key: "lmFeedAPIKey")
    static var apiKey: String?
}

public struct LMFeedTokenResponse: Decodable {
    public let accessToken: String
    public let refreshToken: String
}
