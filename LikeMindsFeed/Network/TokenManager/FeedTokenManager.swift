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
    /// Token manager callback
    private weak var lmCallback: LMCallback?
    /// Refresh token completion block
    fileprivate var refreshTokenBlock: (() -> Void)?
    private var isRefreshingToken: Bool = false
    /// Restrict to create another object of this singleton class
    private init(){}

    public func lmCallback(_ lmCallback: LMCallback) -> FeedTokenManager {
        Self.shared.lmCallback = lmCallback
        return Self.shared
    }

    /// Refresh access token api call
    func refreshInterceptor(_ completion: @escaping ()->Void ) {
        if isRefreshingToken { return }
        guard let refreshToken = LMFeedTokenManager.refreshToken else {
            lmCallback?.login()
            return
        }
        self.refreshTokenBlock = completion
        self.isRefreshingToken = true
        self.refreshAccessToken(refreshToken: refreshToken, withModuleName: "Token-Manager") { [weak self] response in
            guard let initiateResponse = response.data, response.errorMessage == nil else {
                self?.clearToken()
                self?.isRefreshingToken = false
                self?.lmCallback?.login()
                return
            }
            self?.updateToken(initiateResponse.accessToken, initiateResponse.refreshToken)
            self?.isRefreshingToken = false
            completion()
        }
    }
    
    func commonInterceptor(_ key: String = "", value: String = "") -> HTTPHeaders {
        let accessToken = LMFeedTokenManager.accessToken ?? ""
        let buildVersion = BuildManager.buildVersion
        return [
            "x-platform-code": "ios",
            "x-version-code": buildVersion,
            "Cookie":"",
            "x-sdk-source": "feed",
            "Authorization": "Bearer " + accessToken
        ]
    }
    
    private func refreshAccessToken(refreshToken: String, withModuleName moduleName: String, _ response: LMFeedClientResponse<InitiateUserResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.refreshServiceToken(rtm: "")
        guard let url:URL = URL(string: ServiceAPI.authBaseURL + networkPath.apiURL) else {return}
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpSdkHeaders(headerKey: "Authorization", value: refreshToken),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<InitiateUserResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
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
struct UserDefaultsBacked<Value> {
    let key: String
    let userDefaults: UserDefaults

    init(key: String, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }

    var wrappedValue: Value? {
        get {
            return userDefaults.object(forKey: key) as? Value
        }
        set {
            if let value = newValue {
                userDefaults.set(value, forKey: key)
            } else {
                userDefaults.removeObject(forKey: key)
            }
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
