//
//  LMFeedClient.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 16/02/23.
//

import Foundation

public class LMFeedClient {
    
    public static let shared = LMFeedClient()
    
    private init() {}
    
    /// This function configure and initialize dependency frameworks
    /// - Parameter extras: required to Initiation of the SDK
    public func initiateLikeMindsFeed(_ extras: LMChatClient) {
        saveExtrasValuesInLocalPreferences(extras: extras)
        //        BrandingData.shared.invalidateFonts(extras.getFonts())
        initialize()
    }
    
    func initialize() {
        AWSS3Manager().initializeS3()
    }
    
    func saveExtrasValuesInLocalPreferences(extras: LMChatClient) {
        let preferences = PreferencesFactory.userPreferences()
        preferences.put(extras.getApiKey(), forKey: kPrefSdkApiKey)
        if let domain = extras.getDomainUrl() {
            preferences.put(domain, forKey: kPrefDomainUrl)
        }
        _ = preferences.save()
    }
    
}
