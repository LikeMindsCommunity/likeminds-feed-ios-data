//
//  PersistentPreferences.swift
//  CollabMates
//
//  Created by Pushpendra Singh on 29/03/22.
//  Copyright © 2022 CollabMates. All rights reserved.
//

import Foundation
import SwiftUI

class PersistentPreferences: PreferencesImplementation {
    
    // MARK: - NSObject methods
    private var persistentFilePath:String!
    var preferences: NSMutableDictionary!
    
    // MARK: - private methods
    init(name:String!) {
        super.init()
        let paths:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory:String = paths.first ?? ""
            self.persistentFilePath = String(format:"%@/%@", documentsDirectory, name)
            NSLog("Document Directory file path :-> %@", self.persistentFilePath)
            self.load()
    }
    
    override func save() -> Bool {
        do {
            let  data = try NSKeyedArchiver.archivedData(withRootObject: preferences as Any, requiringSecureCoding: true)
            try data.write(to: URL(fileURLWithPath: persistentFilePath))
            return true
        } catch let error  {
            print("Archive error: \(error.localizedDescription)")
            return false
        }
    }
    
    func load() {
        do {
            let contentData = try Data(contentsOf: URL(fileURLWithPath: persistentFilePath))
            let savedPerference: Any = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(contentData) as Any
            if let saved = savedPerference as? NSMutableDictionary {
                preferences = saved
            } else {
                let dict =  NSMutableDictionary()
                guard let path = URL(string: persistentFilePath),
                      let _ = try? dict.write(to: path)
                else {
                    preferences = NSMutableDictionary()
                    return
                }
                let contentData = try Data(contentsOf: URL(fileURLWithPath: persistentFilePath))
                let savedPerferences: Any = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(contentData) as Any
                if let saved = savedPerferences as? NSMutableDictionary {
                    preferences = saved
                }
            }
        } catch let error  {
            preferences = NSMutableDictionary()
            let _ = save()
            print("failed into load persistent file path \(error.localizedDescription)")
        }
    }
    
    // MARK: - Preferences Put methods
    override func putValue(_ value:NSCoding, forKey key:String) {
        preferences.setValue(value, forKey: key)
    }
    
    override func put(_ value: Any, forKey key: String) {
        preferences.setValue(value, forKey: key)
    }
    
    override func removeValue(forKey:String) -> Bool {
        preferences.removeObject(forKey: forKey)
        return true
    }
    
    override func removeAll() -> Bool {
        self.preferences.removeAllObjects()
        return self.save()
    }
    
    // MARK: - Preferences Get methods
    
    override func getValue(forKey: String) -> Any? {
        return self.preferences.value(forKey: forKey)
    }
    
    override func object(forKey:String) -> AnyObject? {
        return self.preferences.value(forKey: forKey) as AnyObject
    }
    
    override func contains(_ forKey:String) -> Bool {
        return self.preferences.object(forKey: forKey) != nil
    }
    
    override func isEmpty() -> Bool {
        return self.preferences.count == 0
    }
    
    func allKeys() -> [Any] {
        return self.preferences.allKeys
    }
}
