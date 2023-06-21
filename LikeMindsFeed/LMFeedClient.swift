//
//  LMFeedClient.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 16/02/23.
//

import Foundation

public class LMFeedClient {
    let moduleName = "LMFeedClient-SDK"
    public private(set) static var shared = LMFeedClient()
    
    private init() {}
    
    public static func builder() -> LMFeedClient {
        Self.shared = LMFeedClient()
        return Self.shared
    }
    
    public func lmCallback(_ lmCallback: LMCallback?) -> LMFeedClient {
        guard let lmCallback = lmCallback else {
            print("--No lmCallback--")
            return Self.shared
        }
        let _ = FeedTokenManager.shared.lmCallback(lmCallback)
        return Self.shared
    }
    
    public func build() -> LMFeedClient {
        return Self.shared
    }
    
}
