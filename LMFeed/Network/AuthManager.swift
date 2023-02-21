//
//  AuthManager.swift
//  LikeMindsChat
//
//  Created by Pushpendra Singh on 13/11/22.
//

import Foundation
import Alamofire
/*
/// Authmanager validate access token
class AuthManager {
    /// Singleton object
    static let shared = AuthManager()
    /// Refresh token completion block
    fileprivate var refreshTokenBlock: (() -> Void)?
    var isRefreshingToken: Bool = false
    /// Restrict developer to create another object of this singleton class
    private init(){}
    
    /// Check saved token is valid or not
    func isValidToken() -> Bool {
        let preferences = PreferencesFactory.userPreferences()
        let accessToken = preferences.string(forKey: kPrefSdkAccessKey)
        let expiryTime =  preferences.double(forKey: kPrefSdkAccessTimeKey) * (15 * 60 * 1000)
        let currentTime = Date().millisecondsSince1970
        return !accessToken.isEmpty && (expiryTime < currentTime)
    }
    /// Refresh access token api call
    func refreshLMToken(_ completion: @escaping ()->Void ) {
        if isRefreshingToken { return }
         let refreshToken = PreferencesFactory.userPreferences().string(forKey: kPrefSdkRefreshKey)
        guard !refreshToken.isEmpty else {
//            LMAppDelegate.sharedInstance().showToastOverKeyboard("Invalid RMT!")
            LikeMinds.shared.delegate?.loginRequiredCallback()
            return
        }
        ChatInitiateEventManager.shared.addObserver(AuthManager.shared)
        self.refreshTokenBlock = completion
        self.isRefreshingToken = true
        LikeMindsChatServiceRequest.refreshChatServiceToken(refreshToken: refreshToken, withModuleName: "SDK-Module")
    }
}

extension AuthManager: ChatServiceInitiateEventObserver {
    
    func didReceiveRefreshToken(_ response: ResponseDataModel<ChatServiceInitiateResponse>?) {
        ChatInitiateEventManager.shared.removeObserver(AuthManager.shared)
        self.isRefreshingToken = false
        guard let initiateResponse = response?.data, response?.errorMessage == nil else {
            PreferenceManager.sharedInstance.newUser()
            LikeMinds.shared.delegate?.loginRequiredCallback()
            return
        }
        
        let preferences = PreferencesFactory.userPreferences()
        preferences.put(initiateResponse.accessToken, forKey: kPrefSdkAccessKey)
        preferences.put(initiateResponse.refreshToken, forKey: kPrefSdkRefreshKey)
        let accessTime = Date().millisecondsSince1970
        preferences.put(accessTime, forKey: kPrefSdkAccessTimeKey)
        _ = preferences.save()
        RefreshAccessToken.shared.stop()
        RefreshTokenTimer.shared.start {[weak self] in
            self?.refreshLMToken {}
        }
        self.refreshTokenBlock?()
    }
    
    func didFailedToReceiveRefreshToken() {
        self.isRefreshingToken = false
        ChatInitiateEventManager.shared.removeObserver(AuthManager.shared)
        LikeMinds.shared.delegate?.loginRequiredCallback()
    }
    
}

*/
