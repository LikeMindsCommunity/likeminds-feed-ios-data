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
    
    
    
    public func getBranding(request: BrandingRequest, response: LMFeedClientResponse<BrandingResponse>?) {
        FeedClientServiceRequest.getBranding(request: request, withModuleName: moduleName) { result in
            response?(result)
        }
    }
    
    
    
}
