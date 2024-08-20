//
//  ServiceConfiguration.swift
//  CollabMates
//
//  Created by Likemind on 14/04/21.
//  Copyright © 2021 CollabMates. All rights reserved.
//

import Foundation


// TODO: remove this useless piece of code
public struct ServiceAPI {
    public static let bucketURL = ServiceConfiguration.bucketURL
    public static let awsPoolIdCognito = ServiceConfiguration.awsPoolIdCognito
    public static let secretAccessKey = ServiceConfiguration.secretAccessKey
    public static let accessKey = ServiceConfiguration.accessKey
}

struct ServiceConfigurationURLs {
    struct Production {
        static let bucketURL = "prod-likeminds-media"
        static let awsPoolIdCognito = "d73bc2ed-bede-42c8-bab7-0abe0a001325"
        static let secretAccessKey = "aG5oTXBlSFZ3N04zWWpEbXVZSittTkwrd2Y2dW12K29IYXo5ZmdmYQ=="
        static let accessKey = "QUtJQTNITVRESUNDV0JTR1Y2N1o="
    }
    struct DevTest {
        static let bucketURL = "beta-likeminds-media"
        static let awsPoolIdCognito = "181963ba-f2db-450b-8199-964a941b38c2"
        static let secretAccessKey = "OWdLeWpGQ3d4Q0RWVDlYaHlNV3VINEdCcXUvVUk3cEFRSkZrNmd1bg=="
        static let accessKey = "QUtJQTNITVRESUNDWUJCWUdJNko="
    }
}


struct ServiceConfiguration {
    static let bucketURL: String = {
        let url: String
        switch BuildManager.environment {
        case .devtest:
            url = ServiceConfigurationURLs.DevTest.bucketURL
        case .production:
            url = ServiceConfigurationURLs.Production.bucketURL
        }
        return url
    }()

    static let secretAccessKey: String = {
        let secretAccessKey: String
        switch BuildManager.environment {
        case .devtest:
            secretAccessKey = ServiceConfigurationURLs.DevTest.secretAccessKey.fromBase64() ?? ""
        case .production:
            secretAccessKey = ServiceConfigurationURLs.Production.secretAccessKey.fromBase64() ?? ""
        }
        return secretAccessKey
    }()

    static let accessKey: String = {
        let accessKey: String
        switch BuildManager.environment {
        case .devtest:
            accessKey = ServiceConfigurationURLs.DevTest.accessKey.fromBase64() ?? ""
        case .production:
            accessKey = ServiceConfigurationURLs.Production.accessKey.fromBase64() ?? ""
        }
        return accessKey
    }()
    
    static let awsPoolIdCognito: String = {
        let accessKey: String
        switch BuildManager.environment {
        case .devtest:
            accessKey = ServiceConfigurationURLs.DevTest.awsPoolIdCognito
        case .production:
            accessKey = ServiceConfigurationURLs.Production.awsPoolIdCognito
        }
        return accessKey
    }()
}
