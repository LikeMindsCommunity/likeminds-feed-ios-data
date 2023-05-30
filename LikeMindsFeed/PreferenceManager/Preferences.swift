//
//  Preferences.swift
//  CollabMates
//
//  Created by Pushpendra Singh on 31/03/22.
//  Copyright © 2022 CollabMates. All rights reserved.
//

import Foundation

protocol Preferences: AnyObject {
    
    func put(_ value:Int, forKey key:String)
    func put(_ value:Int32, forKey key:String)
    func put(_ value:Int64, forKey key:String)
    func put(_ value:String, forKey key:String)
    func put(_ value:Bool, forKey key:String)
    func put(_ value:Float, forKey key:String)
    func put(_ value:Double, forKey key:String)
    func put(_ value: Any, forKey key:String)
    func put(_ value:NSNumber, forKey key:String)
    func putValue(_ value:NSCoding, forKey key:String)
    func put(_ integer:UInt, forKey key:String)
    func removeValue(forKey:String) -> Bool
    func removeAll() -> Bool
    func int(forKey:String) -> Int
    func long(forKey:String) -> Int32
    func longLong(forKey:String) -> Int64
    func string(forKey:String) -> String
    func bool(forKey:String) -> Bool
    func float(forKey:String) -> Float
    func double(forKey:String) -> Double
    func getValue(forKey:String) -> Any?
    func unsignedInterger(forKey:String) -> UInt
    func number(forKey:String) -> NSNumber
    func object(forKey:String) -> AnyObject?
    func contains(_ forKey:String) -> Bool
    func isEmpty() -> Bool
    func save() -> Bool
    func allKeys() -> [AnyObject]
    
}
