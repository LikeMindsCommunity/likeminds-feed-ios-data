//
//  TokenManager.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

/**
 * A protocol to handle login requried action and fired event track.
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


public class TokenManager {
    /// Singleton object property
    static let shared = TokenManager()
    /// Refresh token completion block
    public weak var lmCallback: LMCallback?
    var isRefreshingToken: Bool = false
    public var accessToken: String?
    public var refreshToken: String?
    /// Restrict developer to create another object of this singleton class
    private init(){}
        
}
