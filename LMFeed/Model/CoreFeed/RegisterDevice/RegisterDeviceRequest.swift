//
//  RegisterDeviceRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

public class RegisterDeviceRequest: Encodable {
    var deviceId: String //unique id of user
    var token: String //user name
    var userId: String?
    
    /// Initiate method with device id and device token key param
    public init(_ deviceId: String, token: String) {
        self.deviceId = deviceId
        self.token = token
    }
    
    public func userId(_ userId: String) -> RegisterDeviceRequest {
        self.userId = userId
        return self
    }

    enum CodingKeys: String, CodingKey {
        case token
        case deviceId = "device_id"
        case userId = "member_id"
    }
}
