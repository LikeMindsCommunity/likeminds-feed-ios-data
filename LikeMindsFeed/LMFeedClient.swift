//
//  LMFeedClient.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 16/02/23.
//

import Foundation

public class LMFeedClient {
    let moduleName = "LMFeedClient-SDK"
    public static let shared = LMFeedClient()
    
    private init() {}
    
    /// This function configure and initialize dependency frameworks
    /// - Parameter extras: required to Initiation of the SDK
    public func configureLikeMindsFeed(_ extras: LMChatClient) {
        saveExtrasValuesInLocalPreferences(extras: extras)
        //        BrandingData.shared.invalidateFonts(extras.getFonts())
        initialize()
    }
    
}
