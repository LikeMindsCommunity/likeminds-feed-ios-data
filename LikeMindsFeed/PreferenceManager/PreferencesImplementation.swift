//
//  PreferencesImplementation.swift
//  CollabMates
//
//  Created by Pushpendra Singh on 31/03/22.
//  Copyright © 2022 CollabMates. All rights reserved.
//

import Foundation

class PreferencesImplementation: NSObject, Preferences {
   
    // MARK: - Preferences Put methods
    
    func put(_ value:Int, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ value:Int32, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ value:Int64, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ value: String, forKey key:String) {
        let val = value as NSString
        self.putValue(val, forKey:key)
    }
    
    func put(_ value:Bool, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ value:Float, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ value:Double, forKey key:String) {
        
        self.put(NSNumber(value: value), forKey:key)
    }
    
    func put(_ integer:UInt, forKey key:String) {
        
        self.put(NSNumber(value: integer), forKey:key)
    }
    
    func put(_ value:NSNumber, forKey key:String) {
        
        self.putValue(value, forKey:key)
    }
    
    func putValue(_ value:NSCoding, forKey key:String) {
        
    }
    
    func put(_ value: Any, forKey key: String) {
        
    }
    
    func removeValue(forKey key:String) -> Bool {
        return false
    }
    
    func removeAll() -> Bool {
        
        return false
    }
    
    // MARK: - Preferences Get methods
    
    func int(forKey:String) -> Int {
        
        let value:NSNumber = self.number(forKey: forKey)
        return value.intValue
    }
    
    func long(forKey:String) -> Int32 {
        let value:NSNumber = self.number(forKey: forKey)
        return value.int32Value
    }
    
    func longLong(forKey:String) -> Int64 {
        let value:NSNumber = self.number(forKey: forKey)
        return value.int64Value
    }
    
    func string(forKey:String) -> String {
        if let value  = self.object(forKey: forKey) as? String {
            return value
        }
        return ""
    }
    
    func bool(forKey:String) -> Bool {
        let value:NSNumber = self.number(forKey: forKey)
        return value.boolValue
    }
    
    func float(forKey:String) -> Float {
        let value:NSNumber = self.number(forKey: forKey)
        return value.floatValue
    }
    
    func double(forKey:String) -> Double {
        let value:NSNumber = self.number(forKey: forKey)
        return value.doubleValue
    }
    
    func getValue(forKey:String) -> Any? {
        return nil
    }
    
    func unsignedInterger(forKey:String) -> UInt {
        return self.number(forKey: forKey).uintValue
    }
    
    func number(forKey:String) -> NSNumber {
        guard let value = self.object(forKey: forKey) as? NSNumber else {
            return NSNumber(value: 0)
        }
        return value
    }
    
    func object(forKey:String) -> AnyObject? {
        return nil
    }
    
    // MARK: -
    
    func contains(_ forKey:String) -> Bool {
        
        return self.object(forKey: forKey) != nil
    }
    
    func isEmpty() -> Bool {
        return true
    }
    
    func save() -> Bool {
        return false
    }
    
    func allKeys() -> [AnyObject] {
        
        return []
    }
}
