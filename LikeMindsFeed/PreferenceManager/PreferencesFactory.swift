//
//  PreferencesFactory.swift
//  CollabMates
//
//  Created by Pushpendra Singh on 31/03/22.
//  Copyright © 2022 CollabMates. All rights reserved.
//

import Foundation

let kUserPreferences = "LMUserPreferences.plist"

// User preferences store

var userPreferencesInstance:Preferences? = nil

class PreferencesFactory {
    /**
     * Preferences to store user related infos and that will be cleared when user logs out
     */
    private init() {}
    class func userPreferences() -> Preferences {
        if (userPreferencesInstance == nil) {
            userPreferencesInstance =  PersistentPreferences(name: kUserPreferences)
            return userPreferencesInstance!
        }
        return userPreferencesInstance!
    }
}
