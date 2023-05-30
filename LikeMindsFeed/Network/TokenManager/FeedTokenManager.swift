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
    /// This method called when login required
    func loginRequiredCallback()
}

/// Default implementation of delegate
public extension LMCallback {
    func loginRequiredCallback() {}
}

final public class FeedTokenManager {
    /// Singleton object property
    public static let shared = FeedTokenManager()
    /// Token manager callback
    public weak var lmCallback: LMCallback?
    /// Refresh token completion block
    fileprivate var refreshTokenBlock: (() -> Void)?
    private var isRefreshingToken: Bool = false
    var accessToken: String?
    var refreshToken: String?
    /// Restrict to create another object of this singleton class
    private init(){}
    
    /// Refresh access token api call
    func refreshInterceptor(_ completion: @escaping ()->Void ) {
        if isRefreshingToken { return }
        guard let refreshToken = self.refreshToken else {
            lmCallback?.loginRequiredCallback()
            return
        }
        self.refreshTokenBlock = completion
        self.isRefreshingToken = true
        self.refreshAccessToken(refreshToken: refreshToken, withModuleName: "Token-Manager") { [weak self] response in
            guard let initiateResponse = response.data, response.errorMessage == nil else {
                self?.clearToken()
                self?.isRefreshingToken = false
                self?.lmCallback?.loginRequiredCallback()
                return
            }
            self?.updateToken(initiateResponse.accessToken, initiateResponse.refreshToken)
            self?.isRefreshingToken = false
            completion()
        }
    }
    
    func commonInterceptor(_ key: String = "", value: String = "") -> HTTPHeaders {
        let accessToken = FeedTokenManager.shared.accessToken ?? ""
        let buildVersion = BuildManager.buildVersion
        return [
            "x-platform-code": "ios",
            "x-version-code": buildVersion,
            "Cookie":"",
            "x-source-sdk": "feed",
            "Authorization": "Bearer " + accessToken
        ]
    }
    
    private func refreshAccessToken(refreshToken: String, withModuleName moduleName: String, _ response: LMFeedClientResponse<InitiateUserResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.refreshServiceToken(rtm: "")
        guard let url:URL = URL(string: ServiceAPI.authBaseURL + networkPath.apiURL) else {return}
//
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
        self.refreshToken = refreshToken
        self.accessToken = accessToken
    }
    
    func clearToken() {
        self.refreshToken = nil
        self.accessToken = nil
    }
}
