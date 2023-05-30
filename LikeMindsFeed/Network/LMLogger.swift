//
//  LMLogger.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation
import os

public class LMLogger {
//    private static let logger = Logger(
//        subsystem: Bundle(for: LMLogger.self).bundleIdentifier!,
//        category: String(describing: LMLogger.self)
//    )
    
    static func info(_ message: String) {
        os_log(.info, "Info - ", message)
    }
    
}
