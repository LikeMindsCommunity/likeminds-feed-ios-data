//
//  AppManager.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

//let buildVersion = "373"

enum AppEnvironment {
    case production
    case devtest
}
class AppManager {
    //    static let environment: AppEnvironment = .devtest
    static let environment: AppEnvironment = .production
}
