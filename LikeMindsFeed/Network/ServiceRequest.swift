//
//  ServiceRequest.swift
//  CollabMates
//
//  Created by Likemind on 14/04/21.
//  Copyright © 2021 CollabMates. All rights reserved.
//

import Foundation
import Alamofire

class ServiceRequest {
    static func httpHeaders() -> HTTPHeaders {
        let accessToken = FeedTokenManager.shared.accessToken ?? ""
        let buildVersion = BuildManager.buildVersion
        return [
                "x-platform-code": "ios",
                "x-version-code": buildVersion,
                "x-sdk-source": "feed",
                "Authorization": "Bearer " + accessToken
        ]
    }
    
    static func deviceRegisterHeaders(headerKey: String = "x-api-key", value: String = "") -> HTTPHeaders {
        let accessToken = FeedTokenManager.shared.accessToken ?? ""
        let buildVersion = BuildManager.buildVersion
        return [
            "x-platform-code": "ios",
            "x-version-code": buildVersion,
            headerKey: value,
            "x-sdk-source": "feed",
            "Authorization": "Bearer " + accessToken
        ]
    }
    
    static func httpSdkHeaders(headerKey: String = "x-api-key", value: String = "") -> HTTPHeaders {
        let sdkApiKey = value.isEmpty ? "" : value
        return ["\(headerKey)": sdkApiKey,
                "x-platform-code": "ios",
                "x-version-code": BuildManager.buildVersion,
                "x-sdk-source": "feed"]
    }
    
    static func requestParameters(encodedData: Data) -> Alamofire.Parameters {
        let json = try? JSONSerialization.jsonObject(with: encodedData, options: .fragmentsAllowed)
        guard let params = json as? Alamofire.Parameters else {
            return [:]
        }
        return params
    }
    
}

func jsonParser(from object:Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}

extension Encodable {
    func requestParam() -> Alamofire.Parameters {
        let jsonData = try? JSONEncoder().encode(self)
        guard  let data = jsonData else {
            return [:]
        }
        return ServiceRequest.requestParameters(encodedData: data)
    }
    
    var jsonString: NSString {
        let jsonData = try? JSONEncoder().encode(self)
        guard let data = jsonData else {return ""}
        return NSString(string: data.asString)
    }
    
    func toJSON() -> [String: Any] {
        let encoder = JSONEncoder()
        var dict: [String: Any] = [:]
        
        do {
            let jsonData = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] ?? [:]
        } catch {
            print("Error in encoding object")
        }
        
        return dict
    }
}

extension Data {
    var asString: String {
        let string = String(data: self, encoding: .utf8)
        return string ?? "Unable to generate string from the given data."
    }
}
