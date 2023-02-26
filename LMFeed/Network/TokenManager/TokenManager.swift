//
//  TokenManager.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

/**
 * A protocol to handle login requried action
 *
 */
public protocol LMCallback: AnyObject {
    /// This method called when login required for guest user.
    func loginRequiredCallback()
}

/// Default implementation of delegate
public extension LMCallback {
    func loginRequiredCallback() {}
}

class TokenManager {
    /// Singleton object property
    public static let shared = TokenManager()
    /// Refresh token completion block
    public weak var lmCallback: LMCallback?
    /// Refresh token completion block
    fileprivate var refreshTokenBlock: (() -> Void)?
    private var isRefreshingToken: Bool = false
    var accessToken: String?
    var refreshToken: String?
    /// Restrict developer to create another object of this singleton class
    private init(){}
    
    /// Refresh access token api call
    func refreshLMToken(_ completion: @escaping ()->Void ) {
        if isRefreshingToken { return }
        guard let refreshToken = self.refreshToken else {
            lmCallback?.loginRequiredCallback()
            return
        }
        self.refreshTokenBlock = completion
        self.isRefreshingToken = true
        FeedClientServiceRequest.refreshChatServiceToken(refreshToken: refreshToken, withModuleName: "Token-Manager") { [weak self] response in
            guard let initiateResponse = response.data, response.errorMessage == nil else {
//                PreferenceManager.sharedInstance.newUser()
                self?.lmCallback?.loginRequiredCallback()
                return
            }
            self?.refreshToken = initiateResponse.refreshToken
            self?.accessToken = initiateResponse.accessToken
            RefreshAccessToken.shared.stop()
            RefreshAccessToken.shared.start {
                self?.refreshLMToken{}
            }
            completion()
        }
    }
}
