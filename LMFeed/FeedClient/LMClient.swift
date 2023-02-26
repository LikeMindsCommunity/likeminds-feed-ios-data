//
//  LMClient.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

public protocol LikeMindsCallback: AnyObject {
    /// This method called when login required for guest user.
    func loginRequiredCallback()
}

/// Default implementation of delegate
public extension LikeMindsCallback {
    func loginRequiredCallback() {}
}

public class LMClient {
    
    public static let shared = LMClient()
    private let moduleName = "LMClient-Core"
    
    private init() {}
    
    public func initiateUser(request: InitiateUserRequest, response: LMFeedClientResponse<InitiateUserResponse>?) {
        FeedClientServiceRequest.initiateChatService(request, withModuleName: moduleName) { result in
            TokenManager.shared.accessToken = result.data?.accessToken
            TokenManager.shared.refreshToken = result.data?.refreshToken
            response?(result)
        }
    }
    
    public func registerDevice(request: RegisterDeviceRequest, response: LMFeedClientResponse<RegisterDeviceResponse>?) {
        FeedClientServiceRequest.registerDevice(request: request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func getBranding(request: BrandingRequest, response: LMFeedClientResponse<BrandingResponse>?) {
        FeedClientServiceRequest.getBranding(request: request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    public func logout(response: LMFeedClientResponse<NoData>?) {
        guard let refreshToken = TokenManager.shared.refreshToken else {
            response?(LMResponse.failureResponse("Refresh token not present!"))
            return
        }
        FeedClientServiceRequest.logout(refreshToken: refreshToken, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
}
